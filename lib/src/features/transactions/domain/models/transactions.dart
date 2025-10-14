import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/core.dart';

part 'transactions.freezed.dart';
part 'transactions.g.dart';

@freezed
sealed class Transactions with _$Transactions {
  const factory Transactions.income({
    @JsonKey(includeToJson: false) int? id,
    @Default(TransactionType.income) TransactionType type,
    required int amount,
    required IncomeCategory category,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = TxnIncome;

  const factory Transactions.expense({
    @JsonKey(includeToJson: false) int? id,
    @Default(TransactionType.expense) TransactionType type,
    required int amount,
    required ExpenseCategory category,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = TxnExpense;

  const factory Transactions.goals({
    @JsonKey(includeToJson: false) int? id,
    @Default(TransactionType.goals) TransactionType type,
    required int amount,
    @JsonKey(name: 'goal_id') required int goalId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = TxnGoals;

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
}
