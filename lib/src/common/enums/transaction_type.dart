enum TransactionType {
  income('Income'),
  expense('Expense');

  final String label;
  const TransactionType(this.label);

  bool get isIncome => this == TransactionType.income;
  bool get isExpense => this == TransactionType.expense;
}
