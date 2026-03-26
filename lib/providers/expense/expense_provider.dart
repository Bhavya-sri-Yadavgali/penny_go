import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/expense_model.dart';
import '../global_providers.dart';
import 'filter_provider.dart';

class ExpenseNotifier extends StateNotifier<AsyncValue<List<ExpenseModel>>> {
  final Ref _ref;

  ExpenseNotifier(this._ref) : super(const AsyncValue.loading()) {
    _fetch();
    
    // Auto-fetch expenses when filters change
    _ref.listen(filterProvider, (previous, next) {
      if (previous != next) _fetch();
    });
  }

  Future<void> _fetch() async {
    state = const AsyncValue.loading();
    try {
      final filters = _ref.read(filterProvider);
      final expenses = await _ref.read(expenseRepositoryProvider).getExpenses(
        categoryId: filters.categoryId,
        startDate: filters.startDate,
        endDate: filters.endDate,
        sortBy: filters.sortBy,
        order: filters.order,
      );
      state = AsyncValue.data(expenses);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> create(Map<String, dynamic> data) async {
    try {
      await _ref.read(expenseRepositoryProvider).createExpense(data);
      _fetch();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> delete(String id) async {
    try {
      await _ref.read(expenseRepositoryProvider).deleteExpense(id);
      _fetch();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, AsyncValue<List<ExpenseModel>>>((ref) {
  return ExpenseNotifier(ref);
});
