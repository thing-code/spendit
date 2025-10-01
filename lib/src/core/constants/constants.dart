abstract class SqlCommand {
  static String get executeTransactionTable => '''
      CREATE TABLE IF NOT EXISTS transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        category TEXT,
        amount INTEGER NOT NULL,
        notes TEXT,
        date DATE NOT NULL
      )
      ''';

  static String get executeGoalsTable => '''
      CREATE TABLE IF NOT EXISTS goals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        targetAmount INTEGER NOT NULL,
        progressAmount INTEGER NOT NULL,
        deadline DATE
      )
      ''';

  static String get executeGoalsProgressTable => '''
      CREATE TABLE IF NOT EXISTS goals_progress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        goalsId INTEGER NOT NULL,
        amount INTEGER NOT NULL,
        date DATETIME NOT NULL,
        FOREIGN KEY (goalsId) REFERENCES goals (id) ON DELETE CASCADE
      )
      ''';
}
