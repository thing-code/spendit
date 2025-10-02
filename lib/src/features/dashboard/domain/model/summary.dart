import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
abstract class TransactionSummary with _$TransactionSummary {
  const factory TransactionSummary({
    required int month,
    @Default(0) int income,
    @Default(0) int expense,
  }) = _TransactionSummary;

  factory TransactionSummary.fromJson(Map<String, dynamic> json) => _$TransactionSummaryFromJson(json);
}
