import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/core.dart';

part 'transactions.freezed.dart';
part 'transactions.g.dart';

@freezed
sealed class Transactions with _$Transactions {
  const factory Transactions.income({
    @JsonKey(includeIfNull: false) int? id,
    @Default(TransactionType.income) TransactionType type,
    required int amount,
    required IncomeCategory category,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = Income;

  const factory Transactions.expense({
    @JsonKey(includeIfNull: false) int? id,
    @Default(TransactionType.expense) TransactionType type,
    required int amount,
    required ExpenseCategory category,
    String? notes,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = Expense;

  const factory Transactions.transfer({
    @JsonKey(includeIfNull: false) int? id,
    @Default(TransactionType.goals) TransactionType type,
    required int amount,
    @JsonKey(name: 'goal_id') required int goalId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = Transfer;

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
}
