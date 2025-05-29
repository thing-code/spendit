// Isi budget model
// * category
// * targer_value
// * current_value

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit_core/spendit_core.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
/// [BudgetModel] digunakan untuk menyimpan data budget bulanan per kategori
/// 
/// - [id] adalah id dari budget
/// 
/// - [targetValue] adalah target nilai budget
/// 
/// - [currentValue] adalah nilai budget saat ini
/// 
/// - [category] adalah kategori budget
abstract class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    int? id,
    @Default(0) int targetValue,
    @Default(0) int currentValue,
    required ExpenseCategory category,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}
