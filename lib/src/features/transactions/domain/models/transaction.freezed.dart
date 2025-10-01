// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Transaction _$TransactionFromJson(
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
  'Transaction',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Transaction {

@JsonKey(includeIfNull: false) int? get id; TransactionType get type; int get amount; Enum get category; String? get notes;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,category,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Transaction(id: $id, type: $type, amount: $amount, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, TransactionType type, int amount, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  income,TResult Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  expense,TResult Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  TransferCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  transfer,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Income() when income != null:
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Expense() when expense != null:
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Transfer() when transfer != null:
return transfer(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  income,required TResult Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  expense,required TResult Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  TransferCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  transfer,}) {final _that = this;
switch (_that) {
case Income():
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Expense():
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Transfer():
return transfer(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  IncomeCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  income,TResult? Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  ExpenseCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  expense,TResult? Function(@JsonKey(includeIfNull: false)  int? id,  TransactionType type,  int amount,  TransferCategory category,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  transfer,}) {final _that = this;
switch (_that) {
case Income() when income != null:
return income(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Expense() when expense != null:
return expense(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case Transfer() when transfer != null:
return transfer(_that.id,_that.type,_that.amount,_that.category,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class Income implements Transaction {
  const Income({@JsonKey(includeIfNull: false) this.id, this.type = TransactionType.income, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'income';
  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override@JsonKey() final  TransactionType type;
@override final  int amount;
@override final  IncomeCategory category;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transaction
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
  return 'Transaction.income(id: $id, type: $type, amount: $amount, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IncomeCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory $IncomeCopyWith(Income value, $Res Function(Income) _then) = _$IncomeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, TransactionType type, int amount, IncomeCategory category, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$IncomeCopyWithImpl<$Res>
    implements $IncomeCopyWith<$Res> {
  _$IncomeCopyWithImpl(this._self, this._then);

  final Income _self;
  final $Res Function(Income) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Income(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IncomeCategory,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Expense implements Transaction {
  const Expense({@JsonKey(includeIfNull: false) this.id, this.type = TransactionType.expense, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'expense';
  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override@JsonKey() final  TransactionType type;
@override final  int amount;
@override final  ExpenseCategory category;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transaction
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
  return 'Transaction.expense(id: $id, type: $type, amount: $amount, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ExpenseCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory $ExpenseCopyWith(Expense value, $Res Function(Expense) _then) = _$ExpenseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, TransactionType type, int amount, ExpenseCategory category, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ExpenseCopyWithImpl<$Res>
    implements $ExpenseCopyWith<$Res> {
  _$ExpenseCopyWithImpl(this._self, this._then);

  final Expense _self;
  final $Res Function(Expense) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Expense(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ExpenseCategory,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Transfer implements Transaction {
  const Transfer({@JsonKey(includeIfNull: false) this.id, this.type = TransactionType.transfer, required this.amount, required this.category, this.notes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, final  String? $type}): $type = $type ?? 'transfer';
  factory Transfer.fromJson(Map<String, dynamic> json) => _$TransferFromJson(json);

@override@JsonKey(includeIfNull: false) final  int? id;
@override@JsonKey() final  TransactionType type;
@override final  int amount;
@override final  TransferCategory category;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Transaction
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transfer&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.category, category) || other.category == category)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,amount,category,notes,createdAt,updatedAt);

@override
String toString() {
  return 'Transaction.transfer(id: $id, type: $type, amount: $amount, category: $category, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TransferCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory $TransferCopyWith(Transfer value, $Res Function(Transfer) _then) = _$TransferCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) int? id, TransactionType type, int amount, TransferCategory category, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$TransferCopyWithImpl<$Res>
    implements $TransferCopyWith<$Res> {
  _$TransferCopyWithImpl(this._self, this._then);

  final Transfer _self;
  final $Res Function(Transfer) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? amount = null,Object? category = null,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(Transfer(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TransferCategory,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
