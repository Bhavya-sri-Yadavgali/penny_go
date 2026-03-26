import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/budget_model.dart';
import '../global_providers.dart';

class BudgetNotifier extends StateNotifier<AsyncValue<List<BudgetModel>>> {
  final Ref _ref;

  BudgetNotifier(this._ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  Future<void> _fetch({String? monthYear}) async {
    state = const AsyncValue.loading();
    try {
      // monthYear defaults to current month in repository/backend
      final budgets = await _ref.read(budgetRepositoryProvider).getBudgetUsage(monthYear);
      state = AsyncValue.data(budgets);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> setBudget({
    String? categoryId,
    required double limitAmount,
    required String monthYear,
  }) async {
    try {
      await _ref.read(budgetRepositoryProvider).setBudget({
        'categoryId': categoryId,
        'limitAmount': limitAmount,
        'monthYear': monthYear,
      });
      _fetch(monthYear: monthYear);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> delete(String id) async {
    try {
      await _ref.read(budgetRepositoryProvider).deleteBudget(id);
      _fetch();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final budgetProvider = StateNotifierProvider<BudgetNotifier, AsyncValue<List<BudgetModel>>>((ref) {
  return BudgetNotifier(ref);
});
