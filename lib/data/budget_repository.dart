import '../models/budget_model.dart';
import '../services/api_service.dart';

class BudgetRepository {
  final ApiService _api;

  BudgetRepository(this._api);

  Future<List<BudgetModel>> getBudgets(String? monthYear) async {
    final response = await _api.dio.get('/budgets', queryParameters: {
      'monthYear': monthYear,
    });
    final List data = response.data['data']['budgets'];
    return data.map((json) => BudgetModel.fromJson(json)).toList();
  }

  Future<List<BudgetModel>> getBudgetUsage(String? monthYear) async {
    final response = await _api.dio.get('/budgets/usage', queryParameters: {
      'monthYear': monthYear,
    });
    final List data = response.data['data']['usage'];
    return data.map((json) => BudgetModel.fromJson(json)).toList();
  }

  Future<BudgetModel> setBudget(Map<String, dynamic> data) async {
    final response = await _api.dio.post('/budgets', data: data);
    return BudgetModel.fromJson(response.data['data']);
  }

  Future<void> deleteBudget(String id) async {
    await _api.dio.delete('/budgets/$id');
  }
}
