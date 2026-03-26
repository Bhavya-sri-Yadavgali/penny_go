import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
@HiveType(typeId: 2)
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'user_id') required String userId,
    @HiveField(2) @JsonKey(name: 'category_id') String? categoryId,
    @HiveField(3) @JsonKey(name: 'category_name') String? categoryName,
    @HiveField(4) @JsonKey(name: 'category_color') String? categoryColor,
    @HiveField(5) @JsonKey(name: 'category_icon') String? categoryIcon,
    @HiveField(6) required String title,
    @HiveField(7) required double amount,
    @HiveField(8) String? description,
    @HiveField(9) required DateTime date,
    @HiveField(10) @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);
}
