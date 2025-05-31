import 'package:path/path.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class GoalsDataSource {
  Future<List<FinancialGoalModel>> read();
  Future<int> create(FinancialGoalModel goal);
  Future<int> update(FinancialGoalModel goal);
  Future<int> addProgress(FinancialGoalProgressModel progress);
  Future<int> delete(int id);
}

class GoalsDataSourceImpl implements GoalsDataSource {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final db = await getDatabasesPath();
    final path = join(db, SQLiteTable.goals.name);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(SqlCommand.executeGoalsTable);
        await db.execute(SqlCommand.executeGoalsProgressTable);
      },
    );
  }

  @override
  Future<int> create(FinancialGoalModel goal) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        SQLiteTable.goals.name,
        goal.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<int> delete(int id) async {
    final db = await database;
    return await db.transaction((txn) async {
      return await txn.delete(SQLiteTable.goals.name, where: 'id = ?', whereArgs: [id]);
    });
  }

  @override
  Future<List<FinancialGoalModel>> read() async {
    final db = await database;
    return await db.transaction((txn) async {
      final response = await txn.query(SQLiteTable.goals.name);
      var result = response.map((e) => FinancialGoalModel.fromJson(e)).toList();

      for (var element in result) {
        final progressResponse = await txn.query(
          SQLiteTable.goalsProgress.name,
          where: 'goalsId =?',
          whereArgs: [element.id],
        );
        element = element.copyWith(
          progressData: progressResponse
              .map((e) => FinancialGoalProgressModel.fromJson(e))
              .toList(),
        );
      }

      return result;
    });
  }

  @override
  Future<int> update(FinancialGoalModel goal) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        SQLiteTable.goals.name,
        goal.toJson(),
        where: 'id =?',
        whereArgs: [goal.id],
      );
    });
  }

  @override
  Future<int> addProgress(FinancialGoalProgressModel progress) async {
    final db = await database;
    return db.transaction((txn) async {
      // Insert progress record
      final result = await txn.insert(
        SQLiteTable.goalsProgress.name,
        progress.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // Get current goal data
      final goalResponse = await txn.query(
        SQLiteTable.goals.name,
        where: 'id = ?',
        whereArgs: [progress.goalsId],
      );

      if (goalResponse.isNotEmpty) {
        final goal = FinancialGoalModel.fromJson(goalResponse.first);

        // Update goal's progressAmount
        final updatedGoal = goal.copyWith(progressAmount: goal.progressAmount + progress.amount);

        // Update the goal record
        await txn.update(
          SQLiteTable.goals.name,
          updatedGoal.toJson(),
          where: 'id = ?',
          whereArgs: [progress.goalsId],
        );
      }

      return result;
    });
  }
}
