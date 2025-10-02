import 'package:freezed_annotation/freezed_annotation.dart';

part 'funds.g.dart';
part 'funds.freezed.dart';

@freezed
abstract class Funds with _$Funds {
  const factory Funds({
    int? id,
    required int value,
    required DateTime date,
    @JsonKey(name: 'goals_id') required int goalsId,
  }) = _Funds;

  factory Funds.fromJson(Map<String, dynamic> json) => _$FundsFromJson(json);
}
