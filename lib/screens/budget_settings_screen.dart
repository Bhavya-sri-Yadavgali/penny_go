import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/budget/budget_provider.dart';
import '../providers/category/category_provider.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class BudgetSettingsScreen extends ConsumerWidget {
  const BudgetSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgetState = ref.watch(budgetProvider);
    final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(title: const Text('Budget Limits')),
      body: budgetState.when(
        data: (budgets) => budgets.isEmpty
            ? const Center(child: Text('No budgets set for this month.'))
            : ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: budgets.length,
                itemBuilder: (context, index) {
                  final budget = budgets[index];
                  return Card(
                    child: ListTile(
                      title: Text(budget.categoryName ?? 'Total Budget'),
                      subtitle: Text('Limit: ${currencyFormat.format(budget.limitAmount)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () => ref.read(budgetProvider.notifier).delete(budget.id),
                      ),
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddBudgetDialog(context, ref),
        label: const Text('Add Budget'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showAddBudgetDialog(BuildContext context, WidgetRef ref) {
    final amountController = TextEditingController();
    final categories = ref.read(categoryProvider).value ?? [];
    String? selectedCategoryId;
    final currentMonth = DateFormat('yyyy-MM').format(DateTime.now());

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Set Monthly Budget'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                value: selectedCategoryId,
                decoration: const InputDecoration(labelText: 'Category (Optional)'),
                items: [
                  const DropdownMenuItem(value: null, child: Text('Total Budget')),
                  ...categories.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))),
                ],
                onChanged: (val) => setState(() => selectedCategoryId = val),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: amountController,
                label: 'Limit Amount',
                placeholder: '5000',
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            AppButton(
              text: 'Save',
              isFullWidth: false,
              onPressed: () async {
                final amount = double.tryParse(amountController.text);
                if (amount != null) {
                  await ref.read(budgetProvider.notifier).setBudget(
                        categoryId: selectedCategoryId,
                        limitAmount: amount,
                        monthYear: currentMonth,
                      );
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
