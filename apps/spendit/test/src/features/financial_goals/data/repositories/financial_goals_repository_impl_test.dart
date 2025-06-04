import 'package:flutter_test/flutter_test.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/features/financial_goals/data/datasources/financial_goals_data_source.dart';
import 'package:spendit/src/features/financial_goals/data/repositories/financial_goals_repository_impl.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_progress_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late FinancialGoalsDataSourceImpl dataSource;
  late FinancialGoalsRepositoryImpl repository;

  setUpAll(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await db.execute(SqlCommand.executeGoalsTable);
    await db.execute(SqlCommand.executeGoalsProgressTable);
    dataSource = FinancialGoalsDataSourceImpl(db);
    repository = FinancialGoalsRepositoryImpl(dataSource);
  });

  tearDownAll(() async {
    await db.close();
  });

  group('FinancialRepository Test', () {
    final goal = FinancialGoalModel(id: 1, name: 'Test', targetAmount: 100000);
    final progress = FinancialGoalProgressModel(
      id: 1,
      goalsId: 1,
      amount: 50000,
      date: DateTime.now(),
    );

    test('Create Financial Goals', () async {
      final result = await repository.create(goal);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });

    test('Read Financial Goals', () async {
      final result = await repository.read();
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess([goal]));
    });

    test('Update Financial Goals', () async {
      final result = await repository.update(goal);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });
    test('Add Progress on Financial Goals', () async {
      final result = await repository.addProgress(progress);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });

    test('Delete Financial Goals', () async {
      final result = await repository.delete(1);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });
  });
}
