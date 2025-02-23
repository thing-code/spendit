import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'income_model.freezed.dart';
part 'income_model.g.dart';

@freezed
class IncomeModel with _$IncomeModel {
  const factory IncomeModel({
    int? id,
    required IncomeType type,
    required double value,
    @Default(0) double planned,
    @Default(0) double diff,
    String? description,
    required DateTime date,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) => _$IncomeModelFromJson(json);
}
