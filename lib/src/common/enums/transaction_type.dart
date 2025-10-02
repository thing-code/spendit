import 'package:spendit/src/common/common.dart';

enum TransactionType {
  income(
    'Income',
    SolarIconsOutline.archiveDownMinimalistic,
    Color.fromRGBO(27, 94, 32, 1),
    Color.fromRGBO(200, 230, 201, 1),
  ),
  expense(
    'Expense',
    SolarIconsOutline.archiveUpMinimalistic,
    Color.fromRGBO(183, 28, 28, 1),
    Color.fromRGBO(255, 205, 210, 1),
  );

  final String label;
  final IconData icon;
  final Color cLight;
  final Color cDark;
  const TransactionType(this.label, this.icon, this.cLight, this.cDark);

  bool get isIncome => this == TransactionType.income;
  bool get isExpense => this == TransactionType.expense;
}
