import 'package:freezed_annotation/freezed_annotation.dart';

import 'financial_goal_progress_model.dart';

part 'financial_goal_model.freezed.dart';
part 'financial_goal_model.g.dart';

@freezed
abstract class FinancialGoalModel with _$FinancialGoalModel {
  const factory FinancialGoalModel({
    int? id,
    required String name,
    String? description,
    required int targetAmount,
    @Default(0) int progressAmount,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([]) List<FinancialGoalProgressModel> progressData,
    DateTime? deadline,
  }) = _FinancialGoalModel;

  factory FinancialGoalModel.fromJson(Map<String, dynamic> json) =>
      _$FinancialGoalModelFromJson(json);
}