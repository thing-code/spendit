const String goalsTable = 'goals';
const String fundsTable = 'funds';
const String expenseTable = 'expense';
const String incomeTable = 'income';
const String budgetTable = 'budget';

const String executeBudgetTable =
    '''
    CREATE TABLE $budgetTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT NOT NULL,
      targetValue INTEGER NOT NULL,
      currentValue INTEGER NOT NULL,
    )
    ''';

const String executeExpenseTable =
    '''
    CREATE TABLE $expenseTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT NOT NULL,
      value INTEGER NOT NULL,
      description TEXT,
      date DATE NOT NULL
    )
    ''';

const String executeIncomeTable =
    '''
    CREATE TABLE $incomeTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      value INTEGER NOT NULL,
      date DATE NOT NULL
    )
    ''';

const String executeGoalsTable =
    '''
    CREATE TABLE $goalsTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      target INTEGER NOT NULL,
      progress INTEGER NOT NULL,
      deadline DATE NOT NULL
    )
    ''';

const String executeFundsTable =
    '''
    CREATE TABLE $fundsTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      goals_id INTEGER NOT NULL,
      value INTEGER NOT NULL,
      date DATETIME NOT NULL,
      FOREIGN KEY (goals_id) REFERENCES goals (id) ON DELETE CASCADE
    )
    ''';
