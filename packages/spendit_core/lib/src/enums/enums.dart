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
  income('Pemasukan', SpendItColors.successColor, SpendItColors.successCardColor),
  expense('Pengeluaran', SpendItColors.errorColor, SpendItColors.errorCardColor);

  final String label;
  final Color fg;
  final Color bg;
  const TransactionType(this.label, this.fg, this.bg);
}

enum SQLiteTable {
  goals('goals_database.db'),
  goalsProgress('goals_progress_database.db'),
  budgets('budgets_database.db'),
  transactions('transactions_database.db');

  final String db;
  const SQLiteTable(this.db);
}
