import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/transactions/utils/date_converter.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel.expense({
    int? id,
    required ExpenseCategory category,
    required String description,
    required int amount,
    @Default(TransactionType.expense) TransactionType type,
    @DateConverter() required DateTime date,
  }) = TransactionExpense;
  
  const factory TransactionModel.income({
    int? id,
    required String description,
    required int amount,
    @Default(TransactionType.income) TransactionType type,
    @DateConverter() required DateTime date,
  }) = TransactionIncome;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}
