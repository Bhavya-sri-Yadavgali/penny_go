import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
@HiveType(typeId: 3)
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'user_id') required String userId,
    @HiveField(2) @JsonKey(name: 'category_id') String? categoryId,
    @HiveField(3) @JsonKey(name: 'category_name') String? categoryName,
    @HiveField(4) @JsonKey(name: 'limit_amount') required double limitAmount,
    @HiveField(5) @JsonKey(name: 'month_year') required DateTime monthYear,
    @HiveField(6) @JsonKey(name: 'spent_amount') double? spentAmount,
    @HiveField(7) @JsonKey(name: 'percentage_used') double? percentageUsed,
    @HiveField(8) @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) => _$BudgetModelFromJson(json);
}
