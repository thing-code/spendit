// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Transactions _$TransactionsFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'income':
          return TxnIncome.fromJson(
            json
          );
                case 'expense':
          return TxnExpense.fromJson(
            json
          );
                case 'goals':
          return TxnGoals.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Transactions',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Transactions {

@JsonKey(includeToJson: false) int? get id; TransactionType get type; int get amount;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionsCopyWith<Transactions> get copyWith => _$TransactionsCopyWithImpl<Transactions>(this as Transactions, _$identity);

  /// Serializes this Transactions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transactions&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,createdAt);

@override
String toString() {
  return 'Transactions(id: $id, type: $type, amount: $amount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransactionsCopyWith<$Res>  {
  factory $TransactionsCopyWith(Transactions value, $Res Function(Transactions) _then) = _$TransactionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$TransactionsCopyWithImpl<$Res>
    implements $TransactionsCopyWith<$Res> {
  _$TransactionsCopyWithImpl(this._self, this._then);

  final Transactions _self;
  final $Res Function(Transactions) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Transactions].
extension TransactionsPatterns on Transactions {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TxnIncome value)?  income,TResult Function( TxnExpense value)?  expense,TResult Function( TxnGoals value)?  goals,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TxnIncome() when income != null:
return income(_that);case TxnExpense() when expense != null:
return expense(_that);case TxnGoals() when goals != null:
return goals(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TxnIncome value)  income,required TResult Function( TxnExpense value)  expense,required TResult Function( TxnGoals value)  goals,}){
final _that = this;
switch (_that) {
case TxnIncome():
return income(_that);case TxnExpense():
return expense(_that);case TxnGoals():
return goals(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TxnIncome value)?  income,TResult? Function( TxnExpense value)?  expense,TResult? Function( TxnGoals value)?  goals,}){
final _that = this;
switch (_that) {
case TxnIncome() when income != null:
return income(_that);case TxnExpense() when expense != null:
return expense(_that);case TxnGoals() when goals != null:
return goals(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  income,TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  expense,TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount, @JsonKey(name: 'goal_id')  int goalId, @JsonKey(name: 'created_at')  DateTime createdAt)?  goals,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TxnIncome() when income != null:
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case TxnExpense() when expense != null:
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case TxnGoals() when goals != null:
return goals(_that.id,_that.type,_that.amount,_that.goalId,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  income,required TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  expense,required TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount, @JsonKey(name: 'goal_id')  int goalId, @JsonKey(name: 'created_at')  DateTime createdAt)  goals,}) {final _that = this;
switch (_that) {
case TxnIncome():
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case TxnExpense():
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case TxnGoals():
return goals(_that.id,_that.type,_that.amount,_that.goalId,_that.createdAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  income,TResult? Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  expense,TResult? Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount, @JsonKey(name: 'goal_id')  int goalId, @JsonKey(name: 'created_at')  DateTime createdAt)?  goals,}) {final _that = this;
switch (_that) {
case TxnIncome() when income != null:
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case TxnExpense() when expense != null:
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case TxnGoals() when goals != null:
return goals(_that.id,_that.type,_that.amount,_that.goalId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TxnIncome implements Transactions {
  const TxnIncome({@JsonKey(includeToJson: false) this.id, this.type = TransactionType.income, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'income';
  factory TxnIncome.fromJson(Map<String, dynamic> json) => _$TxnIncomeFromJson(json);

@override@JsonKey(includeToJson: false) final  int? id;
@override@JsonKey() final  TransactionType type;
@override final  int amount;
 final  IncomeCategory category;
 final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxnIncomeCopyWith<TxnIncome> get copyWith => _$TxnIncomeCopyWithImpl<TxnIncome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TxnIncomeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxnIncome&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,category,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Transactions.income(id: $id, type: $type, amount: $amount, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TxnIncomeCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory $TxnIncomeCopyWith(TxnIncome value, $Res Function(TxnIncome) _then) = _$TxnIncomeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount, IncomeCategory category, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TxnIncomeCopyWithImpl<$Res>
    implements $TxnIncomeCopyWith<$Res> {
  _$TxnIncomeCopyWithImpl(this._self, this._then);

  final TxnIncome _self;
  final $Res Function(TxnIncome) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(TxnIncome(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncomeCategory,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TxnExpense implements Transactions {
  const TxnExpense({@JsonKey(includeToJson: false) this.id, this.type = TransactionType.expense, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'expense';
  factory TxnExpense.fromJson(Map<String, dynamic> json) => _$TxnExpenseFromJson(json);

@override@JsonKey(includeToJson: false) final  int? id;
@override@JsonKey() final  TransactionType type;
@override final  int amount;
 final  ExpenseCategory category;
 final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxnExpenseCopyWith<TxnExpense> get copyWith => _$TxnExpenseCopyWithImpl<TxnExpense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TxnExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxnExpense&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,category,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Transactions.expense(id: $id, type: $type, amount: $amount, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TxnExpenseCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory $TxnExpenseCopyWith(TxnExpense value, $Res Function(TxnExpense) _then) = _$TxnExpenseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount, ExpenseCategory category, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TxnExpenseCopyWithImpl<$Res>
    implements $TxnExpenseCopyWith<$Res> {
  _$TxnExpenseCopyWithImpl(this._self, this._then);

  final TxnExpense _self;
  final $Res Function(TxnExpense) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(TxnExpense(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ExpenseCategory,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TxnGoals implements Transactions {
  const TxnGoals({@JsonKey(includeToJson: false) this.id, this.type = TransactionType.goals, required this.amount, @JsonKey(name: 'goal_id') required this.goalId, @JsonKey(name: 'created_at') required this.createdAt, final  String? $type}): $type = $type ?? 'goals';
  factory TxnGoals.fromJson(Map<String, dynamic> json) => _$TxnGoalsFromJson(json);

@override@JsonKey(includeToJson: false) final  int? id;
@override@JsonKey() final  TransactionType type;
@override final  int amount;
@JsonKey(name: 'goal_id') final  int goalId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TxnGoalsCopyWith<TxnGoals> get copyWith => _$TxnGoalsCopyWithImpl<TxnGoals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TxnGoalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TxnGoals&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,goalId,createdAt);

@override
String toString() {
  return 'Transactions.goals(id: $id, type: $type, amount: $amount, goalId: $goalId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TxnGoalsCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory $TxnGoalsCopyWith(TxnGoals value, $Res Function(TxnGoals) _then) = _$TxnGoalsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount,@JsonKey(name: 'goal_id') int goalId,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$TxnGoalsCopyWithImpl<$Res>
    implements $TxnGoalsCopyWith<$Res> {
  _$TxnGoalsCopyWithImpl(this._self, this._then);

  final TxnGoals _self;
  final $Res Function(TxnGoals) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? goalId = null,Object? createdAt = null,}) {
  return _then(TxnGoals(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,goalId: null == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
