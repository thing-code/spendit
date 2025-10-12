enum TransactionType {
  income('Income'),
  expense('Expense'),
  goals('Goals');

  final String title;

  const TransactionType(this.title);
}

enum IncomeCategory {
  salary('Salary'),
  investment('Investment'),
  freelance('Freelance');

  final String title;

  const IncomeCategory(this.title);
}

enum ExpenseCategory {
  family('Family'),
  shopping('Shopping'),
  reward('Reward'),
  health('Health'),
  bill('Bill'),
  transport('Transport'),
  food('Food'),
  other('Other');

  final String title;

  const ExpenseCategory(this.title);
}
