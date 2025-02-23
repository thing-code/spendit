import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
   factory ExpenseModel({
    int? id,
    required ExpenseType type,
    required double value,
    @Default(0) double planned,
    @Default(0) double diff,
    String? description,
    DateTime? date,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => _$ExpenseModelFromJson(json);
}
