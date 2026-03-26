import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/category/category_provider.dart';
import '../providers/expense/expense_provider.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class AddExpenseSheet extends ConsumerStatefulWidget {
  const AddExpenseSheet({super.key});

  @override
  ConsumerState<AddExpenseSheet> createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends ConsumerState<AddExpenseSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();
  String? _budgetWarning;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_checkBudget);
  }

  @override
  void dispose() {
    _amountController.removeListener(_checkBudget);
    super.dispose();
  }

  void _checkBudget() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount <= 0) {
      setState(() => _budgetWarning = null);
      return;
    }

    final budgets = ref.read(budgetProvider).value ?? [];
    // Find matching budget for selected category or total
    final budget = budgets.firstWhere(
      (b) => b.categoryId == _selectedCategoryId,
      orElse: () => budgets.firstWhere((b) => b.categoryId == null, orElse: () => budgets.first),
    );

    final remaining = budget.limitAmount - (budget.spentAmount ?? 0);
    if (amount > remaining) {
      setState(() => _budgetWarning = '⚠️ This will exceed your remaining budget (₹${remaining.toStringAsFixed(0)})');
    } else {
      setState(() => _budgetWarning = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(categoryProvider);

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add New Expense',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            AppTextField(
              controller: _titleController,
              label: 'Title',
              placeholder: 'Lunch, Grocery, Rent',
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _amountController,
              label: 'Amount',
              placeholder: '0.00',
              keyboardType: TextInputType.number,
            ),
            if (_budgetWarning != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  _budgetWarning!,
                  style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 16),
            categoriesState.when(
              data: (categories) => DropdownButtonFormField<String>(
                value: _selectedCategoryId,
                decoration: InputDecoration(
                  labelText: 'Category',
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
                onChanged: (val) {
                  setState(() => _selectedCategoryId = val);
                  _checkBudget();
                },
              ),
              loading: () => const LinearProgressIndicator(),
              error: (e, _) => Text('Error loading categories: $e'),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (date != null) setState(() => _selectedDate = date);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Date',
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(DateFormat('yyyy-MM-dd').format(_selectedDate)),
              ),
            ),
            const SizedBox(height: 32),
            AppButton(
              text: 'Save Expense',
              isLoading: ref.watch(expenseProvider).isLoading,
              onPressed: () async {
                final amount = double.tryParse(_amountController.text);
                if (_titleController.text.isNotEmpty && amount != null) {
                  await ref.read(expenseProvider.notifier).create({
                    'title': _titleController.text.trim(),
                    'amount': amount,
                    'categoryId': _selectedCategoryId,
                    'date': DateFormat('yyyy-MM-dd').format(_selectedDate),
                    'description': _descriptionController.text.trim(),
                  });
                  if (context.mounted) Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
