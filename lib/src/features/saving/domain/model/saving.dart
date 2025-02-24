import 'package:freezed_annotation/freezed_annotation.dart';

part 'saving.freezed.dart';
part 'saving.g.dart';

@freezed
class Saving with _$Saving {
  const factory Saving({
    int? id,
    required double value,
    String? description,
    required DateTime date,
  }) = _Saving;

  factory Saving.fromJson(Map<String, dynamic> json) => _$SavingFromJson(json);
}

@freezed
class TotalSaving with _$TotalSaving {
  const factory TotalSaving({
    int? id,
    @Default(0) double planned,
    @Default(0) double diff,
  }) = _TotalSaving;

  factory TotalSaving.fromJson(Map<String, dynamic> json) => _$TotalSavingFromJson(json);
}
