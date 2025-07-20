import 'dart:ui';

import 'package:spendit_core/spendit_core.dart';

enum ExpenseCategory {
  food('Makan', Color(0xFFFFB547)),
  health('Kesehatan', Color(0xFF4FFFB0)),
  sport('Olahraga', Color(0xFF00CFFF)),
  transport('Transportasi', Color(0xFF6C4FF6)),
  shopping('Belanja', Color(0xFFFF4F7B)),
  family('Keluarga', Color.fromARGB(255, 255, 94, 244)),
  other('Lainnya', Color(0xFF2A2B3C));

  final String label;
  final Color color;
  const ExpenseCategory(this.label, this.color);
}

enum TransactionType {
  income('Pemasukan', SiColors.success),
  expense('Pengeluaran', SiColors.danger);

  final String label;
  final Color color;
  const TransactionType(this.label, this.color);
}

enum SQLiteTable { goals, goalsProgress, budgets, transactions }
