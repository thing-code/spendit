import 'package:json_annotation/json_annotation.dart';
import 'package:spendit_core/spendit_core.dart';

class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toFormat();
}
