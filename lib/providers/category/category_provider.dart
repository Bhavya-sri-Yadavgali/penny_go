import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/category_model.dart';
import '../global_providers.dart';

class CategoryNotifier extends StateNotifier<AsyncValue<List<CategoryModel>>> {
  final Ref _ref;

  CategoryNotifier(this._ref) : super(const AsyncValue.loading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    state = const AsyncValue.loading();
    try {
      final categories = await _ref.read(categoryRepositoryProvider).getCategories();
      state = AsyncValue.data(categories);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> create(String name, String? icon, String? color) async {
    try {
      await _ref.read(categoryRepositoryProvider).createCategory({
        'name': name,
        'icon': icon,
        'color': color,
      });
      _fetch(); // Refresh list
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> delete(String id) async {
    try {
      await _ref.read(categoryRepositoryProvider).deleteCategory(id);
      _fetch();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final categoryProvider = StateNotifierProvider<CategoryNotifier, AsyncValue<List<CategoryModel>>>((ref) {
  return CategoryNotifier(ref);
});
