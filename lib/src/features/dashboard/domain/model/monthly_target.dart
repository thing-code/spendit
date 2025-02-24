import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'monthly_target.freezed.dart';
part 'monthly_target.g.dart';

@freezed
class MonthlyTarget with _$MonthlyTarget {
  const factory MonthlyTarget({
    int? id,
    required double value,
    required TargetType type,
  }) = _MonthlyTarget;

  factory MonthlyTarget.fromJson(Map<String, dynamic> json) => _$MonthlyTargetFromJson(json);
}