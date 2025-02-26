import 'package:json_annotation/json_annotation.dart';
import 'package:spendit/src/common/common.dart';

class DateQueryConverter implements JsonConverter<DateTime, String> {
  const DateQueryConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.getCompactDate;
}
