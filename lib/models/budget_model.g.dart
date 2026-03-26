// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetModelAdapter extends TypeAdapter<BudgetModel> {
  @override
  final int typeId = 3;

  @override
  BudgetModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      categoryId: fields[2] as String?,
      categoryName: fields[3] as String?,
      limitAmount: fields[4] as double,
      monthYear: fields[5] as DateTime,
      spentAmount: fields[6] as double?,
      percentageUsed: fields[7] as double?,
      createdAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.categoryId)
      ..writeByte(3)
      ..write(obj.categoryName)
      ..writeByte(4)
      ..write(obj.limitAmount)
      ..writeByte(5)
      ..write(obj.monthYear)
      ..writeByte(6)
      ..write(obj.spentAmount)
      ..writeByte(7)
      ..write(obj.percentageUsed)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      limitAmount: (json['limit_amount'] as num).toDouble(),
      monthYear: DateTime.parse(json['month_year'] as String),
      spentAmount: (json['spent_amount'] as num?)?.toDouble(),
      percentageUsed: (json['percentage_used'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'limit_amount': instance.limitAmount,
      'month_year': instance.monthYear.toIso8601String(),
      'spent_amount': instance.spentAmount,
      'percentage_used': instance.percentageUsed,
      'created_at': instance.createdAt.toIso8601String(),
    };
