import 'package:intl/intl.dart';

extension NumberFormatter on double {
  String get toRupiah {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(this);
  }

  String get toRupiahCompact {
    final formatter = NumberFormat.compactCurrency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(this);
  }
}
