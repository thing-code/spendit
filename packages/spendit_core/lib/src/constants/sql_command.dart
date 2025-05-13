final String goalsDb = 'goals.db';
final String fundsDb = 'funds.db';
final String expenseDb = 'expense.db';
final String incomeDb = 'income.db';

final String executeExpenseTable = '''
    CREATE TABLE $expenseDb (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT NOT NULL,
      value INTEGER NOT NULL,
      description TEXT,
      date DATE NOT NULL
    )
''';

final String executeIncomeTable = '''
    CREATE TABLE $incomeDb (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      value INTEGER NOT NULL,
      date DATE NOT NULL
    )
''';

final String executeGoalsTable = '''
    CREATE TABLE $goalsDb (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      target INTEGER NOT NULL,
      progress INTEGER NOT NULL,
      deadline DATE NOT NULL
    )
''';
final String executeFundsTable = '''
    CREATE TABLE $fundsDb (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      goals_id INTEGER NOT NULL,
      value INTEGER NOT NULL,
      date DATETIME NOT NULL,
      FOREIGN KEY (goals_id) REFERENCES goals (id) ON DELETE CASCADE
    )
''';
