import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/category/category_provider.dart';
import '../providers/expense/filter_provider.dart';
import '../widgets/app_button.dart';

class FilterSheet extends ConsumerStatefulWidget {
  const FilterSheet({super.key});

  @override
  ConsumerState<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends ConsumerState<FilterSheet> {
  late FilterState _tempFilter;

  @override
  void initState() {
    super.initState();
    _tempFilter = ref.read(filterProvider);
  }

  void _applyPresets(String range) {
    final now = DateTime.now();
    DateTime start;
    DateTime end = now;

    if (range == 'This Month') {
      start = DateTime(now.year, now.month, 1);
    } else if (range == 'Last Month') {
      start = DateTime(now.year, now.month - 1, 1);
      end = DateTime(now.year, now.month, 0); // Last day of previous month
    } else {
      return;
    }

    setState(() {
      _tempFilter = _tempFilter.copyWith(
        startDate: DateFormat('yyyy-MM-dd').format(start),
        endDate: DateFormat('yyyy-MM-dd').format(end),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryProvider).value ?? [];

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter Transactions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          
          const Text('Date Range', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Row(
            children: [
              _presetChip('This Month'),
              const SizedBox(width: 8),
              _presetChip('Last Month'),
              const Spacer(),
              TextButton(
                onPressed: _showDateRangePicker,
                child: const Text('Custom Range'),
              ),
            ],
          ),
          if (_tempFilter.startDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Selected: ${_tempFilter.startDate} to ${_tempFilter.endDate}',
                style: const TextStyle(fontSize: 12, color: Colors.indigo, fontWeight: FontWeight.bold),
              ),
            ),
          
          const SizedBox(height: 24),
          const Text('Category', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ChoiceChip(
                  label: const Text('All'),
                  selected: _tempFilter.categoryId == null,
                  onSelected: (_) => setState(() => _tempFilter = _tempFilter.copyWith(categoryId: null)),
                ),
                ...categories.map((c) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ChoiceChip(
                        label: Text(c.name),
                        selected: _tempFilter.categoryId == c.id,
                        onSelected: (selected) => setState(() => _tempFilter = _tempFilter.copyWith(categoryId: selected ? c.id : null)),
                      ),
                    )),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          const Text('Sort By', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          Row(
            children: [
              _sortChip('Date', 'date'),
              const SizedBox(width: 8),
              _sortChip('Amount', 'amount'),
              const Spacer(),
              IconButton(
                icon: Icon(_tempFilter.order == 'DESC' ? Icons.arrow_downward : Icons.arrow_upward),
                onPressed: () => setState(() => _tempFilter = _tempFilter.copyWith(order: _tempFilter.order == 'DESC' ? 'ASC' : 'DESC')),
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    ref.read(filterProvider.notifier).reset();
                    Navigator.pop(context);
                  },
                  child: const Text('Reset All'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppButton(
                  text: 'Apply Filters',
                  onPressed: () {
                    ref.read(filterProvider.notifier).state = _tempFilter;
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _presetChip(String label) {
    return ActionChip(
      label: Text(label),
      onPressed: () => _applyPresets(label),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _sortChip(String label, String key) {
    final isSelected = _tempFilter.sortBy == key;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (sel) => setState(() => _tempFilter = _tempFilter.copyWith(sortBy: key)),
    );
  }

  Future<void> _showDateRangePicker() async {
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (range != null) {
      setState(() {
        _tempFilter = _tempFilter.copyWith(
          startDate: DateFormat('yyyy-MM-dd').format(range.start),
          endDate: DateFormat('yyyy-MM-dd').format(range.end),
        );
      });
    }
  }
}
