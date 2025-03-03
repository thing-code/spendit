import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'income.freezed.dart';
part 'income.g.dart';

@freezed
abstract class Income with _$Income {
  const factory Income({
    int? id,
    required IncomeType type,
    required int value,
    String? description,
    @DateQueryConverter() required DateTime date,
  }) = _Income;

  factory Income.fromJson(Map<String, dynamic> json) => _$IncomeFromJson(json);
}