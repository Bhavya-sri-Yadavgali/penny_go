// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpenseModelAdapter extends TypeAdapter<ExpenseModel> {
  @override
  final int typeId = 2;

  @override
  ExpenseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpenseModel(
      id: fields[0] as String,
      userId: fields[1] as String,
      categoryId: fields[2] as String?,
      categoryName: fields[3] as String?,
      categoryColor: fields[4] as String?,
      categoryIcon: fields[5] as String?,
      title: fields[6] as String,
      amount: fields[7] as double,
      description: fields[8] as String?,
      date: fields[9] as DateTime,
      createdAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ExpenseModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.categoryId)
      ..writeByte(3)
      ..write(obj.categoryName)
      ..writeByte(4)
      ..write(obj.categoryColor)
      ..writeByte(5)
      ..write(obj.categoryIcon)
      ..writeByte(6)
      ..write(obj.title)
      ..writeByte(7)
      ..write(obj.amount)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.date)
      ..writeByte(10)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpenseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseModelImpl _$$ExpenseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpenseModelImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      categoryId: json['category_id'] as String?,
      categoryName: json['category_name'] as String?,
      categoryColor: json['category_color'] as String?,
      categoryIcon: json['category_icon'] as String?,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String?,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ExpenseModelImplToJson(_$ExpenseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'category_color': instance.categoryColor,
      'category_icon': instance.categoryIcon,
      'title': instance.title,
      'amount': instance.amount,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
