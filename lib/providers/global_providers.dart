import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';
import '../data/auth_repository.dart';
import '../data/expense_repository.dart';
import '../data/category_repository.dart';
import '../data/budget_repository.dart';
import '../services/api_service.dart';

import '../services/local_database_service.dart';
import '../services/sync_manager.dart';

// Service Providers
final apiServiceProvider = Provider((ref) => ApiService());
final localDbProvider = Provider((ref) => LocalDatabaseService());
final syncManagerProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  final db = ref.watch(localDbProvider);
  return SyncManager(api, db);
});

// Repository Providers
final authRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  return AuthRepository(api);
});

final expenseRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  final db = ref.watch(localDbProvider);
  final sync = ref.watch(syncManagerProvider);
  return ExpenseRepository(api, db, sync);
});

final categoryRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  return CategoryRepository(api);
});

final budgetRepositoryProvider = Provider((ref) {
  final api = ref.watch(apiServiceProvider);
  return BudgetRepository(api);
});

