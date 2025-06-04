import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/features/budgets/data/datasources/budget_data_source.dart';
import 'package:spendit/src/features/budgets/domain/models/budget_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockBudgetDataSourceImpl extends Mock implements BudgetDataSourceImpl {}

void main() {
  late BudgetDataSource dataSource;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    dataSource = MockBudgetDataSourceImpl();

    registerFallbackValue(BudgetModel(id: 1, category: ExpenseCategory.food, targetAmount: 100000));
  });

  group('BudgetDataSource Test', () {
    final budget = BudgetModel(category: ExpenseCategory.food, targetAmount: 100000);

    test('Create Budget', () async {
      when(() => dataSource.create(any())).thenAnswer((_) async => 1);

      final result = await dataSource.create(budget);

      expect(result, 1);
      verify(() => dataSource.create(budget)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Read Budget', () async {
      when(() => dataSource.read()).thenAnswer((_) async => [budget]);
      final result = await dataSource.read();
      expect(result, [budget]);
      verify(() => dataSource.read()).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Update Budget', () async {
      when(() => dataSource.update(any())).thenAnswer((_) async => 1);
      final result = await dataSource.update(budget);
      expect(result, 1);
      verify(() => dataSource.update(budget)).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });
}
