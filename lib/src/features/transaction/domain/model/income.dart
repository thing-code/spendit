import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'income.freezed.dart';
part 'income.g.dart';

@freezed
class Income with _$Income {
  const factory Income({
    int? id,
    required IncomeType type,
    required double value,
    @Default(0) double planned,
    @Default(0) double diff,
    String? description,
    required DateTime date,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
}
