import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_progress_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class FinancialGoalsDataSource {
  Future<List<FinancialGoalModel>> read();
  Future<int> create(FinancialGoalModel goal);
  Future<int> update(FinancialGoalModel goal);
  Future<int> addProgress(FinancialGoalProgressModel progress);
  Future<int> delete(int id);
}

class FinancialGoalsDataSourceImpl implements FinancialGoalsDataSource {
  final Database db;

  FinancialGoalsDataSourceImpl(this.db);

  @override
  Future<int> create(FinancialGoalModel goal) async {
    return db.insert(
      SQLiteTable.goals.name,
      goal.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<int> delete(int id) async {
    return await db.delete(SQLiteTable.goals.name, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<FinancialGoalModel>> read() async {
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
    return db.update(SQLiteTable.goals.name, goal.toJson(), where: 'id =?', whereArgs: [goal.id]);
  }

  @override
  Future<int> addProgress(FinancialGoalProgressModel progress) async {
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
