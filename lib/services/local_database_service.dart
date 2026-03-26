import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_model.dart';
import '../models/expense_model.dart';
import '../models/category_model.dart';
import '../models/budget_model.dart';
import '../models/sync_command.dart';

class LocalDatabaseService {
  static const String expenseBoxName = 'expenses';
  static const String categoryBoxName = 'categories';
  static const String budgetBoxName = 'budgets';
  static const String syncBoxName = 'sync_queue';
  static const String userBoxName = 'user_profile';

  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Register Adapters
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
    Hive.registerAdapter(ExpenseModelAdapter());
    Hive.registerAdapter(BudgetModelAdapter());
    Hive.registerAdapter(SyncActionAdapter());
    Hive.registerAdapter(SyncCommandAdapter());

    // Open Boxes
    await Hive.openBox<UserModel>(userBoxName);
    await Hive.openBox<CategoryModel>(categoryBoxName);
    await Hive.openBox<ExpenseModel>(expenseBoxName);
    await Hive.openBox<BudgetModel>(budgetBoxName);
    await Hive.openBox<SyncCommand>(syncBoxName);
  }

  // Generic methods for data access
  Box<T> getBox<T>(String name) => Hive.box<T>(name);

  Future<void> clearAll() async {
    await Hive.box<UserModel>(userBoxName).clear();
    await Hive.box<CategoryModel>(categoryBoxName).clear();
    await Hive.box<ExpenseModel>(expenseBoxName).clear();
    await Hive.box<BudgetModel>(budgetBoxName).clear();
    await Hive.box<SyncCommand>(syncBoxName).clear();
  }
}
