import 'package:intl/intl.dart';

extension NullableIntegerExt on int? {
  String get currency =>
      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(this);
  String get thousand =>
      NumberFormat.decimalPattern('id').format(this);
}

extension IntegerExt on int {
  String get currency =>
      NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(this);
  String get thousand =>
      NumberFormat.decimalPattern('id').format(this);
}
