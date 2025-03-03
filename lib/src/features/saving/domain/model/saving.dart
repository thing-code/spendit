import 'package:freezed_annotation/freezed_annotation.dart';

part 'saving.freezed.dart';
part 'saving.g.dart';

@freezed
abstract class Saving with _$Saving {
  const factory Saving({int? id, required int value, required DateTime date}) = _Saving;

  factory Saving.fromJson(Map<String, dynamic> json) => _$SavingFromJson(json);
}
