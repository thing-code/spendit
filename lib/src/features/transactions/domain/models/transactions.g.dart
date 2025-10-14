// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TxnIncome _$TxnIncomeFromJson(Map<String, dynamic> json) => TxnIncome(
  id: (json['id'] as num?)?.toInt(),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.income,
  amount: (json['amount'] as num).toInt(),
  category: $enumDecode(_$IncomeCategoryEnumMap, json['category']),
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TxnIncomeToJson(TxnIncome instance) => <String, dynamic>{
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'category': _$IncomeCategoryEnumMap[instance.category]!,
  'notes': instance.notes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'runtimeType': instance.$type,
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
  TransactionType.goals: 'goals',
};

const _$IncomeCategoryEnumMap = {
  IncomeCategory.salary: 'salary',
  IncomeCategory.investment: 'investment',
  IncomeCategory.freelance: 'freelance',
};

TxnExpense _$TxnExpenseFromJson(Map<String, dynamic> json) => TxnExpense(
  id: (json['id'] as num?)?.toInt(),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.expense,
  amount: (json['amount'] as num).toInt(),
  category: $enumDecode(_$ExpenseCategoryEnumMap, json['category']),
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TxnExpenseToJson(TxnExpense instance) =>
    <String, dynamic>{
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'category': _$ExpenseCategoryEnumMap[instance.category]!,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'runtimeType': instance.$type,
    };

const _$ExpenseCategoryEnumMap = {
  ExpenseCategory.family: 'family',
  ExpenseCategory.shopping: 'shopping',
  ExpenseCategory.reward: 'reward',
  ExpenseCategory.health: 'health',
  ExpenseCategory.bill: 'bill',
  ExpenseCategory.transport: 'transport',
  ExpenseCategory.food: 'food',
  ExpenseCategory.other: 'other',
};

TxnGoals _$TxnGoalsFromJson(Map<String, dynamic> json) => TxnGoals(
  id: (json['id'] as num?)?.toInt(),
  type:
      $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
      TransactionType.goals,
  amount: (json['amount'] as num).toInt(),
  goalId: (json['goal_id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$TxnGoalsToJson(TxnGoals instance) => <String, dynamic>{
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'amount': instance.amount,
  'goal_id': instance.goalId,
  'created_at': instance.createdAt.toIso8601String(),
  'runtimeType': instance.$type,
};
