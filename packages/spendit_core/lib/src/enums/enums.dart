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
  income('Pemasukan', SIColors.success),
  expense('Pengeluaran', SIColors.error);

  final String label;
  final Color color;
  const TransactionType(this.label, this.color);
}

enum SQLiteTable { goals, goalsProgress, budgets, transactions }
