import 'package:flutter_test/flutter_test.dart';
import 'package:penny_go/models/expense_model.dart';

void main() {
  group('ExpenseModel', () {
    test('ExpenseModel.fromJson should parse correctly', () {
      final json = {
        'id': '1',
        'user_id': 'user_123',
        'category_id': 'cat_456',
        'category_name': 'Food',
        'category_color': '#FF0000',
        'category_icon': 'fastfood',
        'title': 'Dinner',
        'amount': 25.5,
        'description': 'Pasta',
        'date': '2026-03-26T12:00:00.000',
        'created_at': '2026-03-26T12:00:00.000',
      };

      final expense = ExpenseModel.fromJson(json);

      expect(expense.id, '1');
      expect(expense.amount, 25.5);
      expect(expense.categoryName, 'Food');
      expect(expense.date, DateTime.parse('2026-03-26T12:00:00.000'));
    });

    test('ExpenseModel should correctly serialize to JSON', () {
      final expense = ExpenseModel(
        id: '1',
        userId: 'user_123',
        title: 'Dinner',
        amount: 25.5,
        date: DateTime.parse('2026-03-26T12:00:00.000'),
        createdAt: DateTime.parse('2026-03-26T12:00:00.000'),
      );

      final json = expense.toJson();

      expect(json['id'], '1');
      expect(json['amount'], 25.5);
      expect(json['date'], '2026-03-26T12:00:00.000');
    });
   group('ExpenseModel Validation', () {
      test('Should handle null optional fields', () {
        final json = {
          'id': '1',
          'user_id': 'user_123',
          'title': 'Dinner',
          'amount': 25.5,
          'date': '2026-03-26T12:00:00.000',
          'created_at': '2026-03-26T12:00:00.000',
        };

        final expense = ExpenseModel.fromJson(json);

        expect(expense.categoryId, isNull);
        expect(expense.categoryName, isNull);
        expect(expense.description, isNull);
      });
    });
  });
}
