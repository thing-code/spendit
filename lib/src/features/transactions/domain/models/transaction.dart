import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/core/core.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
sealed class Transaction with _$Transaction {
  const factory Transaction.income({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'user_id') required String userId,
    @Default(TransactionType.income) TransactionType type,
    required int amount,
    required IncomeCategory category,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = Income;

  const factory Transaction.expense({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'user_id') required String userId,
    @Default(TransactionType.expense) TransactionType type,
    required int amount,
    required ExpenseCategory category,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = Expense;

  const factory Transaction.transfer({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'user_id') required String userId,
    @Default(TransactionType.transfer) TransactionType type,
    required int amount,
    required TransferCategory category,
    String? notes,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = Transfer;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
