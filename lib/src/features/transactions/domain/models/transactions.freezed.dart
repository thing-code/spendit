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
          return Income.fromJson(
            json
          );
                case 'expense':
          return Expense.fromJson(
            json
          );
                case 'transfer':
          return Transfer.fromJson(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Income value)?  income,TResult Function( Expense value)?  expense,TResult Function( Transfer value)?  transfer,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Income() when income != null:
return income(_that);case Expense() when expense != null:
return expense(_that);case Transfer() when transfer != null:
return transfer(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Income value)  income,required TResult Function( Expense value)  expense,required TResult Function( Transfer value)  transfer,}){
final _that = this;
switch (_that) {
case Income():
return income(_that);case Expense():
return expense(_that);case Transfer():
return transfer(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Income value)?  income,TResult? Function( Expense value)?  expense,TResult? Function( Transfer value)?  transfer,}){
final _that = this;
switch (_that) {
case Income() when income != null:
return income(_that);case Expense() when expense != null:
return expense(_that);case Transfer() when transfer != null:
return transfer(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  income,TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  expense,TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount, @JsonKey(name: 'goal_id')  int goalId, @JsonKey(name: 'created_at')  DateTime createdAt)?  transfer,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Income() when income != null:
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Expense() when expense != null:
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Transfer() when transfer != null:
return transfer(_that.id,_that.type,_that.amount,_that.goalId,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  income,required TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  expense,required TResult Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount, @JsonKey(name: 'goal_id')  int goalId, @JsonKey(name: 'created_at')  DateTime createdAt)  transfer,}) {final _that = this;
switch (_that) {
case Income():
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Expense():
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Transfer():
return transfer(_that.id,_that.type,_that.amount,_that.goalId,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  income,TResult? Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  expense,TResult? Function(@JsonKey(includeToJson: false)  int? id,  TransactionType type,  int amount, @JsonKey(name: 'goal_id')  int goalId, @JsonKey(name: 'created_at')  DateTime createdAt)?  transfer,}) {final _that = this;
switch (_that) {
case Income() when income != null:
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Expense() when expense != null:
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Transfer() when transfer != null:
return transfer(_that.id,_that.type,_that.amount,_that.goalId,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class Income implements Transactions {
  const Income({@JsonKey(includeToJson: false) this.id, this.type = TransactionType.income, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'income';
  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

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
$IncomeCopyWith<Income> get copyWith => _$IncomeCopyWithImpl<Income>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Income&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
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
abstract mixin class $IncomeCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) _then) = _$IncomeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount, IncomeCategory category, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$IncomeCopyWithImpl<$Res>
    implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._self, this._then);

  final Income _self;
  final $Res Function(Income) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(Income(
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

class Expense implements Transactions {
  const Expense({@JsonKey(includeToJson: false) this.id, this.type = TransactionType.expense, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'expense';
  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

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
$ExpenseCopyWith<Expense> get copyWith => _$ExpenseCopyWithImpl<Expense>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Expense&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
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
abstract mixin class $ExpenseCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount, ExpenseCategory category, String? notes,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(Expense(
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

class Transfer implements Transactions {
  const Transfer({@JsonKey(includeToJson: false) this.id, this.type = TransactionType.goals, required this.amount, @JsonKey(name: 'goal_id') required this.goalId, @JsonKey(name: 'created_at') required this.createdAt, final  String? $type}): $type = $type ?? 'transfer';
  factory Transfer.fromJson(Map<String, dynamic> json) => _$TransferFromJson(json);

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
$TransferCopyWith<Transfer> get copyWith => _$TransferCopyWithImpl<Transfer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transfer&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,goalId,createdAt);

@override
String toString() {
  return 'Transactions.transfer(id: $id, type: $type, amount: $amount, goalId: $goalId, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TransferCopyWith<$Res> implements $TransactionsCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) _then) = _$TransferCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) int? id, TransactionType type, int amount,@JsonKey(name: 'goal_id') int goalId,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$TransferCopyWithImpl<$Res>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._self, this._then);

  final Transfer _self;
  final $Res Function(Transfer) _then;

/// Create a copy of Transactions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? goalId = null,Object? createdAt = null,}) {
  return _then(Transfer(
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
