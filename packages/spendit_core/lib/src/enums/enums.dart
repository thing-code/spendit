import 'dart:ui';

import 'package:spendit_core/spendit_core.dart';

enum ExpenseCategory {
  food('Food'),
  health('Health'),
  sport('Sport'),
  transport('Transport'),
  shopping('Shopping'),
  family('Family'),
  other('Other');

  final String label;
  const ExpenseCategory(this.label);
}

enum TransactionType {
  income('Income', SpendItColors.successColor, SpendItColors.successCardColor),
  expense('Expense', SpendItColors.errorColor, SpendItColors.errorCardColor);

  final String label;
  final Color fg;
  final Color bg;
  const TransactionType(this.label, this.fg, this.bg);
}
