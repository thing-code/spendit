import 'dart:ui';

import 'package:spendit_core/spendit_core.dart';

enum ExpenseCategory {
  food('Makan'),
  health('Kesehatan'),
  sport('Olahraga'),
  transport('Transportasi'),
  shopping('Belanja'),
  family('Keluarga'),
  other('Lainnya');

  final String label;
  const ExpenseCategory(this.label);
}

enum TransactionType {
  income('Pemasukan', SIColors.successColor, SIColors.successCardColor),
  expense('Pengeluaran', SIColors.errorColor, SIColors.errorCardColor);

  final String label;
  final Color fg;
  final Color bg;
  const TransactionType(this.label, this.fg, this.bg);
}

enum SQLiteTable { goals, goalsProgress, budgets, transactions }
