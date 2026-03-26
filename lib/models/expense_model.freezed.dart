// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) {
  return _ExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'category_id')
  String? get categoryId => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'category_color')
  String? get categoryColor => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'category_icon')
  String? get categoryIcon => throw _privateConstructorUsedError;
  @HiveField(6)
  String get title => throw _privateConstructorUsedError;
  @HiveField(7)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(9)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) then) =
      _$ExpenseModelCopyWithImpl<$Res, ExpenseModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'category_id') String? categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') String? categoryName,
      @HiveField(4) @JsonKey(name: 'category_color') String? categoryColor,
      @HiveField(5) @JsonKey(name: 'category_icon') String? categoryIcon,
      @HiveField(6) String title,
      @HiveField(7) double amount,
      @HiveField(8) String? description,
      @HiveField(9) DateTime date,
      @HiveField(10) @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res, $Val extends ExpenseModel>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryColor = freezed,
    Object? categoryIcon = freezed,
    Object? title = null,
    Object? amount = null,
    Object? description = freezed,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseModelImplCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$$ExpenseModelImplCopyWith(
          _$ExpenseModelImpl value, $Res Function(_$ExpenseModelImpl) then) =
      __$$ExpenseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'category_id') String? categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') String? categoryName,
      @HiveField(4) @JsonKey(name: 'category_color') String? categoryColor,
      @HiveField(5) @JsonKey(name: 'category_icon') String? categoryIcon,
      @HiveField(6) String title,
      @HiveField(7) double amount,
      @HiveField(8) String? description,
      @HiveField(9) DateTime date,
      @HiveField(10) @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$ExpenseModelImplCopyWithImpl<$Res>
    extends _$ExpenseModelCopyWithImpl<$Res, _$ExpenseModelImpl>
    implements _$$ExpenseModelImplCopyWith<$Res> {
  __$$ExpenseModelImplCopyWithImpl(
      _$ExpenseModelImpl _value, $Res Function(_$ExpenseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? categoryColor = freezed,
    Object? categoryIcon = freezed,
    Object? title = null,
    Object? amount = null,
    Object? description = freezed,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_$ExpenseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryColor: freezed == categoryColor
          ? _value.categoryColor
          : categoryColor // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryIcon: freezed == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseModelImpl implements _ExpenseModel {
  const _$ExpenseModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'user_id') required this.userId,
      @HiveField(2) @JsonKey(name: 'category_id') this.categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') this.categoryName,
      @HiveField(4) @JsonKey(name: 'category_color') this.categoryColor,
      @HiveField(5) @JsonKey(name: 'category_icon') this.categoryIcon,
      @HiveField(6) required this.title,
      @HiveField(7) required this.amount,
      @HiveField(8) this.description,
      @HiveField(9) required this.date,
      @HiveField(10) @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ExpenseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @HiveField(2)
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @override
  @HiveField(3)
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  @HiveField(4)
  @JsonKey(name: 'category_color')
  final String? categoryColor;
  @override
  @HiveField(5)
  @JsonKey(name: 'category_icon')
  final String? categoryIcon;
  @override
  @HiveField(6)
  final String title;
  @override
  @HiveField(7)
  final double amount;
  @override
  @HiveField(8)
  final String? description;
  @override
  @HiveField(9)
  final DateTime date;
  @override
  @HiveField(10)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'ExpenseModel(id: $id, userId: $userId, categoryId: $categoryId, categoryName: $categoryName, categoryColor: $categoryColor, categoryIcon: $categoryIcon, title: $title, amount: $amount, description: $description, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryColor, categoryColor) ||
                other.categoryColor == categoryColor) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      categoryId,
      categoryName,
      categoryColor,
      categoryIcon,
      title,
      amount,
      description,
      date,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      __$$ExpenseModelImplCopyWithImpl<_$ExpenseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseModelImplToJson(
      this,
    );
  }
}

abstract class _ExpenseModel implements ExpenseModel {
  const factory _ExpenseModel(
      {@HiveField(0) required final String id,
      @HiveField(1) @JsonKey(name: 'user_id') required final String userId,
      @HiveField(2) @JsonKey(name: 'category_id') final String? categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') final String? categoryName,
      @HiveField(4)
      @JsonKey(name: 'category_color')
      final String? categoryColor,
      @HiveField(5) @JsonKey(name: 'category_icon') final String? categoryIcon,
      @HiveField(6) required final String title,
      @HiveField(7) required final double amount,
      @HiveField(8) final String? description,
      @HiveField(9) required final DateTime date,
      @HiveField(10)
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$ExpenseModelImpl;

  factory _ExpenseModel.fromJson(Map<String, dynamic> json) =
      _$ExpenseModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @HiveField(2)
  @JsonKey(name: 'category_id')
  String? get categoryId;
  @override
  @HiveField(3)
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  @HiveField(4)
  @JsonKey(name: 'category_color')
  String? get categoryColor;
  @override
  @HiveField(5)
  @JsonKey(name: 'category_icon')
  String? get categoryIcon;
  @override
  @HiveField(6)
  String get title;
  @override
  @HiveField(7)
  double get amount;
  @override
  @HiveField(8)
  String? get description;
  @override
  @HiveField(9)
  DateTime get date;
  @override
  @HiveField(10)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ExpenseModelImplCopyWith<_$ExpenseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
