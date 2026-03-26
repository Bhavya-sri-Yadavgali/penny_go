import '../models/category_model.dart';
import '../services/api_service.dart';

class CategoryRepository {
  final ApiService _api;

  CategoryRepository(this._api);

  Future<List<CategoryModel>> getCategories() async {
    final response = await _api.dio.get('/categories');
    final List data = response.data['data']['categories'];
    return data.map((json) => CategoryModel.fromJson(json)).toList();
  }

  Future<CategoryModel> createCategory(Map<String, dynamic> data) async {
    final response = await _api.dio.post('/categories', data: data);
    return CategoryModel.fromJson(response.data['data']['category']);
  }

  Future<void> updateCategory(String id, Map<String, dynamic> data) async {
    await _api.dio.put('/categories/$id', data: data);
  }

  Future<void> deleteCategory(String id) async {
    await _api.dio.delete('/categories/$id');
  }
}
