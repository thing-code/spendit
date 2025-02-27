enum TransactionType {
  income('Income'),
  expense('Expense');

  final String label;
  const TransactionType(this.label);
}
