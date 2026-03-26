import 'package:dio/dio.dart';
import '../models/expense_model.dart';
import '../models/sync_command.dart';
import '../services/api_service.dart';
import '../services/local_database_service.dart';
import '../services/sync_manager.dart';

class ExpenseRepository {
  final ApiService _api;
  final LocalDatabaseService _localDb;
  final SyncManager _syncManager;

  ExpenseRepository(this._api, this._localDb, this._syncManager);

  Future<List<ExpenseModel>> getExpenses({
    String? categoryId,
    String? startDate,
    String? endDate,
    String? sortBy,
    String? order,
  }) async {
    final box = _localDb.getBox<ExpenseModel>(LocalDatabaseService.expenseBoxName);

    try {
      final response = await _api.dio.get('/expenses', queryParameters: {
        'categoryId': categoryId,
        'startDate': startDate,
        'endDate': endDate,
        'sortBy': sortBy,
        'order': order,
      });

      final List data = response.data['data']['expenses'];
      final expenses = data.map((json) => ExpenseModel.fromJson(json)).toList();

      // Update local cache
      await box.clear();
      await box.putAll({for (var e in expenses) e.id: e});

      return expenses;
    } catch (e) {
      // If offline, return local data filtered in memory
      print('Offline: Fetching from local cache');
      var expenses = box.values.toList();
      
      if (categoryId != null) {
        expenses = expenses.where((e) => e.categoryId == categoryId).toList();
      }
      // Add other memory filters if needed
      
      return expenses;
    }
  }

  Future<void> createExpense(Map<String, dynamic> data) async {
    final tempId = 'temp_${DateTime.now().millisecondsSinceEpoch}';
    final box = _localDb.getBox<ExpenseModel>(LocalDatabaseService.expenseBoxName);

    try {
      final response = await _api.dio.post('/expenses', data: data);
      final expense = ExpenseModel.fromJson(response.data['data']['expense']);
      await box.put(expense.id, expense);
    } catch (e) {
      // Offline: Add to sync queue and local cache
      final command = SyncCommand(
        id: tempId,
        endpoint: '/expenses',
        action: SyncAction.create,
        data: data,
        timestamp: DateTime.now(),
      );
      await _syncManager.addCommand(command);
      
      // We don't have a full ExpenseModel yet, so we'll just wait for sync
      // or we could create a dummy one.
    }
  }

  Future<void> deleteExpense(String id) async {
    final box = _localDb.getBox<ExpenseModel>(LocalDatabaseService.expenseBoxName);
    await box.delete(id);

    try {
      await _api.dio.delete('/expenses/$id');
    } catch (e) {
      final command = SyncCommand(
        id: id,
        endpoint: '/expenses',
        action: SyncAction.delete,
        timestamp: DateTime.now(),
      );
      await _syncManager.addCommand(command);
    }
  }

  Future<Map<String, dynamic>> getAnalytics() async {
    try {
      final response = await _api.dio.get('/expenses/analytics');
      return response.data['data']['analytics'];
    } catch (e) {
      return {}; // Placeholder for offline analytics
    }
  }
}
