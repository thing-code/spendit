import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'expense.freezed.dart';
part 'expense.g.dart';

@freezed
class Expense with _$Expense {
   factory Expense({
    int? id,
    required BudgetType type,
    required int value,
    String? description,
    @DateQueryConverter() required DateTime date,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) => _$ExpenseFromJson(json);
}
