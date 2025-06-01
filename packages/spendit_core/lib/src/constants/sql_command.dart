import 'package:spendit_core/spendit_core.dart';

abstract class SqlCommand {
  static String get executeBudgetTable =>
      '''
      CREATE TABLE IF NOT EXISTS ${SQLiteTable.budgets.name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT NOT NULL,
        targetAmount INTEGER NOT NULL,
        currentAmount INTEGER NOT NULL
      )
      ''';

  static String get executeTransactionTable =>
      '''
      CREATE TABLE IF NOT EXISTS ${SQLiteTable.transactions.name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        category TEXT,
        amount INTEGER NOT NULL,
        description TEXT,
        date DATE NOT NULL,
        runtimeType TEXT
      )
      ''';

  static String get executeGoalsTable =>
      '''
      CREATE TABLE IF NOT EXISTS ${SQLiteTable.goals.name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        targetAmount INTEGER NOT NULL,
        progressAmount INTEGER NOT NULL,
        deadline DATE
      )
      ''';

  static String get executeGoalsProgressTable =>
      '''
      CREATE TABLE IF NOT EXISTS ${SQLiteTable.goalsProgress.name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        goalsId INTEGER NOT NULL,
        amount INTEGER NOT NULL,
        date DATETIME NOT NULL,
        FOREIGN KEY (goalsId) REFERENCES goals (id) ON DELETE CASCADE
      )
      ''';
}
