// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) {
  return _BudgetModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetModel {
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
  @JsonKey(name: 'limit_amount')
  double get limitAmount => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'month_year')
  DateTime get monthYear => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'spent_amount')
  double? get spentAmount => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'percentage_used')
  double? get percentageUsed => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
          BudgetModel value, $Res Function(BudgetModel) then) =
      _$BudgetModelCopyWithImpl<$Res, BudgetModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'category_id') String? categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') String? categoryName,
      @HiveField(4) @JsonKey(name: 'limit_amount') double limitAmount,
      @HiveField(5) @JsonKey(name: 'month_year') DateTime monthYear,
      @HiveField(6) @JsonKey(name: 'spent_amount') double? spentAmount,
      @HiveField(7) @JsonKey(name: 'percentage_used') double? percentageUsed,
      @HiveField(8) @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res, $Val extends BudgetModel>
    implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

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
    Object? limitAmount = null,
    Object? monthYear = null,
    Object? spentAmount = freezed,
    Object? percentageUsed = freezed,
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
      limitAmount: null == limitAmount
          ? _value.limitAmount
          : limitAmount // ignore: cast_nullable_to_non_nullable
              as double,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as DateTime,
      spentAmount: freezed == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageUsed: freezed == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetModelImplCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$BudgetModelImplCopyWith(
          _$BudgetModelImpl value, $Res Function(_$BudgetModelImpl) then) =
      __$$BudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) @JsonKey(name: 'user_id') String userId,
      @HiveField(2) @JsonKey(name: 'category_id') String? categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') String? categoryName,
      @HiveField(4) @JsonKey(name: 'limit_amount') double limitAmount,
      @HiveField(5) @JsonKey(name: 'month_year') DateTime monthYear,
      @HiveField(6) @JsonKey(name: 'spent_amount') double? spentAmount,
      @HiveField(7) @JsonKey(name: 'percentage_used') double? percentageUsed,
      @HiveField(8) @JsonKey(name: 'created_at') DateTime createdAt});
}

/// @nodoc
class __$$BudgetModelImplCopyWithImpl<$Res>
    extends _$BudgetModelCopyWithImpl<$Res, _$BudgetModelImpl>
    implements _$$BudgetModelImplCopyWith<$Res> {
  __$$BudgetModelImplCopyWithImpl(
      _$BudgetModelImpl _value, $Res Function(_$BudgetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? limitAmount = null,
    Object? monthYear = null,
    Object? spentAmount = freezed,
    Object? percentageUsed = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$BudgetModelImpl(
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
      limitAmount: null == limitAmount
          ? _value.limitAmount
          : limitAmount // ignore: cast_nullable_to_non_nullable
              as double,
      monthYear: null == monthYear
          ? _value.monthYear
          : monthYear // ignore: cast_nullable_to_non_nullable
              as DateTime,
      spentAmount: freezed == spentAmount
          ? _value.spentAmount
          : spentAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      percentageUsed: freezed == percentageUsed
          ? _value.percentageUsed
          : percentageUsed // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetModelImpl implements _BudgetModel {
  const _$BudgetModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) @JsonKey(name: 'user_id') required this.userId,
      @HiveField(2) @JsonKey(name: 'category_id') this.categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') this.categoryName,
      @HiveField(4) @JsonKey(name: 'limit_amount') required this.limitAmount,
      @HiveField(5) @JsonKey(name: 'month_year') required this.monthYear,
      @HiveField(6) @JsonKey(name: 'spent_amount') this.spentAmount,
      @HiveField(7) @JsonKey(name: 'percentage_used') this.percentageUsed,
      @HiveField(8) @JsonKey(name: 'created_at') required this.createdAt});

  factory _$BudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetModelImplFromJson(json);

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
  @JsonKey(name: 'limit_amount')
  final double limitAmount;
  @override
  @HiveField(5)
  @JsonKey(name: 'month_year')
  final DateTime monthYear;
  @override
  @HiveField(6)
  @JsonKey(name: 'spent_amount')
  final double? spentAmount;
  @override
  @HiveField(7)
  @JsonKey(name: 'percentage_used')
  final double? percentageUsed;
  @override
  @HiveField(8)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @override
  String toString() {
    return 'BudgetModel(id: $id, userId: $userId, categoryId: $categoryId, categoryName: $categoryName, limitAmount: $limitAmount, monthYear: $monthYear, spentAmount: $spentAmount, percentageUsed: $percentageUsed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.limitAmount, limitAmount) ||
                other.limitAmount == limitAmount) &&
            (identical(other.monthYear, monthYear) ||
                other.monthYear == monthYear) &&
            (identical(other.spentAmount, spentAmount) ||
                other.spentAmount == spentAmount) &&
            (identical(other.percentageUsed, percentageUsed) ||
                other.percentageUsed == percentageUsed) &&
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
      limitAmount,
      monthYear,
      spentAmount,
      percentageUsed,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      __$$BudgetModelImplCopyWithImpl<_$BudgetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetModelImplToJson(
      this,
    );
  }
}

abstract class _BudgetModel implements BudgetModel {
  const factory _BudgetModel(
      {@HiveField(0) required final String id,
      @HiveField(1) @JsonKey(name: 'user_id') required final String userId,
      @HiveField(2) @JsonKey(name: 'category_id') final String? categoryId,
      @HiveField(3) @JsonKey(name: 'category_name') final String? categoryName,
      @HiveField(4)
      @JsonKey(name: 'limit_amount')
      required final double limitAmount,
      @HiveField(5)
      @JsonKey(name: 'month_year')
      required final DateTime monthYear,
      @HiveField(6) @JsonKey(name: 'spent_amount') final double? spentAmount,
      @HiveField(7)
      @JsonKey(name: 'percentage_used')
      final double? percentageUsed,
      @HiveField(8)
      @JsonKey(name: 'created_at')
      required final DateTime createdAt}) = _$BudgetModelImpl;

  factory _BudgetModel.fromJson(Map<String, dynamic> json) =
      _$BudgetModelImpl.fromJson;

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
  @JsonKey(name: 'limit_amount')
  double get limitAmount;
  @override
  @HiveField(5)
  @JsonKey(name: 'month_year')
  DateTime get monthYear;
  @override
  @HiveField(6)
  @JsonKey(name: 'spent_amount')
  double? get spentAmount;
  @override
  @HiveField(7)
  @JsonKey(name: 'percentage_used')
  double? get percentageUsed;
  @override
  @HiveField(8)
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
