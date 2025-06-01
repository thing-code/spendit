import 'package:freezed_annotation/freezed_annotation.dart';

part 'financial_goal_progress_model.freezed.dart';
part 'financial_goal_progress_model.g.dart';

@freezed
abstract class FinancialGoalProgressModel with _$FinancialGoalProgressModel {
  const factory FinancialGoalProgressModel({
    int? id,
    required int amount,
    required int goalsId,
    required DateTime date,
  }) = _FinancialGoalProgressModel;

  factory FinancialGoalProgressModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialGoalProgressModelFromJson(json);
}
