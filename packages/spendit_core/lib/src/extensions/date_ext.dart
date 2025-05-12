import 'package:intl/intl.dart';

extension DateExt on DateTime {
  toFormat([String? newPattern, String? locale]) {
    return DateFormat(newPattern, locale).format(this);
  }

  String get title => toFormat('MMMM yyyy');

  bool get isSunday => weekday == 7;

  bool get isToday {
    var today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }
}
