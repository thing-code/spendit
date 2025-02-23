import 'package:freezed_annotation/freezed_annotation.dart';

part 'saving_model.freezed.dart';
part 'saving_model.g.dart';

@freezed
class SavingModel with _$SavingModel {
  const factory SavingModel({
    int? id,
    required double value,
    String? description,
    required DateTime date,
  }) = _SavingModel;

  factory SavingModel.fromJson(Map<String, dynamic> json) => _$SavingModelFromJson(json);
}

@freezed
class TotalSavingModel with _$TotalSavingModel {
  const factory TotalSavingModel({
    int? id,
    @Default(0) double planned,
    @Default(0) double diff,
  }) = _TotalSavingModel;

  factory TotalSavingModel.fromJson(Map<String, dynamic> json) => _$TotalSavingModelFromJson(json);
}
