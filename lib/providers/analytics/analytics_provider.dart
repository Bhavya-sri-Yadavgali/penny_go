import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../global_providers.dart';

class AnalyticsNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
  final Ref _ref;

  AnalyticsNotifier(this._ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = const AsyncValue.loading();
    try {
      final analytics = await _ref.read(expenseRepositoryProvider).getAnalytics();
      state = AsyncValue.data(analytics);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void refresh() => _fetch();
}

final analyticsProvider = StateNotifierProvider<AnalyticsNotifier, AsyncValue<Map<String, dynamic>>>((ref) {
  return AnalyticsNotifier(ref);
});
