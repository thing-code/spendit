// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Income _$IncomeFromJson(Map<String, dynamic> json) => Income(
  id: (json['id'] as num?)?.toInt(),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.income,
  amount: (json['amount'] as num).toInt(),
  category: $enumDecode(_$IncomeCategoryEnumMap, json['category']),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$IncomeToJson(Income instance) => <String, dynamic>{
  'id': ?instance.id,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'category': _$IncomeCategoryEnumMap[instance.category]!,
  'notes': instance.notes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'runtimeType': instance.$type,
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
  TransactionType.goals: 'goals',
};

const _$IncomeCategoryEnumMap = {
  IncomeCategory.sallary: 'sallary',
  IncomeCategory.investment: 'investment',
  IncomeCategory.freelance: 'freelance',
};

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
  id: (json['id'] as num?)?.toInt(),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.expense,
  amount: (json['amount'] as num).toInt(),
  category: $enumDecode(_$ExpenseCategoryEnumMap, json['category']),
  notes: json['notes'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
  'id': ?instance.id,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'category': _$ExpenseCategoryEnumMap[instance.category]!,
  'notes': instance.notes,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'runtimeType': instance.$type,
};

const _$ExpenseCategoryEnumMap = {
  ExpenseCategory.family: 'family',
  ExpenseCategory.shopping: 'shopping',
  ExpenseCategory.reward: 'reward',
  ExpenseCategory.health: 'health',
  ExpenseCategory.billing: 'billing',
  ExpenseCategory.transportation: 'transportation',
  ExpenseCategory.investment: 'investment',
  ExpenseCategory.food: 'food',
  ExpenseCategory.other: 'other',
};

Transfer _$TransferFromJson(Map<String, dynamic> json) => Transfer(
  id: (json['id'] as num?)?.toInt(),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.goals,
  amount: (json['amount'] as num).toInt(),
  goalId: (json['goal_id'] as num).toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TransferToJson(Transfer instance) => <String, dynamic>{
  'id': ?instance.id,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'goal_id': instance.goalId,
  'created_at': instance.createdAt?.toIso8601String(),
  'runtimeType': instance.$type,
};
