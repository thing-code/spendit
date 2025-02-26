import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spendit/src/common/common.dart';

part 'saving.freezed.dart';
part 'saving.g.dart';

@freezed
class Saving with _$Saving {
  const factory Saving({
    int? id,
    required int value,
    String? description,
    @DateQueryConverter() required DateTime date,
  }) = _Saving;

  factory Saving.fromJson(Map<String, dynamic> json) => _$SavingFromJson(json);
}
