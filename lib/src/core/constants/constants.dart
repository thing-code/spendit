abstract class SqlCommand {
  static String get executeTransactionTable =>
      '''
      CREATE TABLE IF NOT EXISTS $kTransactionTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        category TEXT,
        amount INTEGER NOT NULL,
        notes TEXT,
        created_at DATETIME NOT NULL
      )
      ''';

  static String get executeGoalsTable =>
      '''
      CREATE TABLE IF NOT EXISTS $kGoalsTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        target INTEGER NOT NULL,
        current INTEGER NOT NULL,
        target_date DATE,
        created_at DATETIME NOT NULL,
      )
      ''';

  static String get executeGoalsProgressTable =>
      '''
      CREATE TABLE IF NOT EXISTS $kGoalsProgressTable (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        goal_id INTEGER NOT NULL,
        amount INTEGER NOT NULL,
        created_at DATETIME NOT NULL,
        FOREIGN KEY (goal_id) REFERENCES goals (id) ON DELETE CASCADE
      )
      ''';
}

final kTransactionTable = 'transactions';
final kGoalsTable = 'goals';
final kGoalsProgressTable = 'goals_progress';
