import 'package:freezed_annotation/freezed_annotation.dart';

part 'goals.freezed.dart';
part 'goals.g.dart';

@freezed
abstract class Goals with _$Goals {
  const factory Goals({
    int? id,
    required String name,
    @Default(0) int target,
    @Default(0) int progress,
    required DateTime deadline,
  }) = _Goals;

  factory Goals.fromJson(Map<String, dynamic> json) => _$GoalsFromJson(json);
}
