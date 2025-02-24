import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
   factory Expense({
    int? id,
    required ExpenseType type,
    required double value,
    @Default(0) double planned,
    @Default(0) double diff,
    String? description,
    DateTime? date,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);
}
