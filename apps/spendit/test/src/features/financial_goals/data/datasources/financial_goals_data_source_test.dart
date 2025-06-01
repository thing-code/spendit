import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spendit_remake/src/features/financial_goals/data/datasources/financial_goals_data_source.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_progress_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockFinancialGoalsDataSource extends Mock implements FinancialGoalsDataSource {}

void main() {
  late FinancialGoalsDataSource dataSource;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    dataSource = MockFinancialGoalsDataSource();

    registerFallbackValue(FinancialGoalModel(id: 1, name: 'Test', targetAmount: 100000));
    registerFallbackValue(
      FinancialGoalProgressModel(id: 1, goalsId: 1, amount: 50000, date: DateTime.now()),
    );
  });

  group('FinancialDataSource Test', () {
    final financialGoal = FinancialGoalModel(name: 'Test', targetAmount: 100000);

    test('Create Financial Goal', () async {
      when(() => dataSource.create(any())).thenAnswer((_) async => 1);
      final result = await dataSource.create(financialGoal);
      expect(result, 1);
      verify(() => dataSource.create(financialGoal)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Read Financial Goal', () async {
      when(() => dataSource.read()).thenAnswer((_) async => [financialGoal]);
      final result = await dataSource.read();
      expect(result, [financialGoal]);
      verify(() => dataSource.read()).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Add Progress to Financial Goal', () async {
      when(() => dataSource.addProgress(any())).thenAnswer((_) async => 1);
      final result = await dataSource.addProgress(
        FinancialGoalProgressModel(goalsId: 1, amount: 50000, date: DateTime.now()),
      );
      expect(result, 1);
      verify(() => dataSource.addProgress(any())).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Update Financial Goal', () async {
      when(() => dataSource.update(any())).thenAnswer((_) async => 1);
      final result = await dataSource.update(financialGoal);
      expect(result, 1);
      verify(() => dataSource.update(financialGoal)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Delete Financial Goal', () async {
      when(() => dataSource.delete(any())).thenAnswer((_) async => 1);
      final result = await dataSource.delete(1);
      expect(result, 1);
      verify(() => dataSource.delete(1)).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });
}
