import 'package:freezed_annotation/freezed_annotation.dart';

part 'sallary.g.dart';
part 'sallary.freezed.dart';

@freezed
class Sallary with _$Sallary {
  const factory Sallary({
    required int month,
    @Default(0) double value,
  }) = _Sallary;

  factory Sallary.fromJson(Map<String, dynamic> json) => _$SallaryFromJson(json);
}
