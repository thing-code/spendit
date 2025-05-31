import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/budgets/data/datasources/budget_data_source.dart';
import 'package:spendit_remake/src/features/budgets/domain/models/budget_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockBudgetDataSourceImpl extends Mock implements BudgetDataSourceImpl {}

void main() {
  late Database db;
  late BudgetDataSource dataSource;

  setUpAll(() async {
    sqfliteFfiInit();
    db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.execute(SqlCommand.executeBudgetTable);
    dataSource = BudgetDataSourceForTest(db);
  });

  tearDownAll(() async {
    await db.close();
  });

  group('Database Test', () {
    test('Database - Create New Budget', () async {
      final budget = BudgetModel(category: ExpenseCategory.food, targetAmount: 1050000);
      final result = await db.insert(SQLiteTable.budgets.name, budget.toJson());
      expect(result, 1);
    });

    test('Database - Read All Budgets', () async {
      final budget = BudgetModel(id: 1, category: ExpenseCategory.food, targetAmount: 1050000);
      final result = await db.query(SQLiteTable.budgets.name);
      expect(result, [budget.toJson()]);
    });

    test('Database - Update A Budget', () async {
      final budget = BudgetModel(id: 1, category: ExpenseCategory.family, targetAmount: 1000000);
      final result = await db.update(
        SQLiteTable.budgets.name,
        budget.toJson(),
        where: 'id =?',
        whereArgs: [1],
      );
      expect(result, 1);
    });
  });

  group('DataSource Test', () {
    test('DataSource - Create New Budget', () async {
      final budget = BudgetModel(category: ExpenseCategory.food, targetAmount: 1050000);
      final result = await dataSource.create(budget);
      expect(result, 2);
    });

    test('DataSource - Read All Budgets', () async {
      final budget = BudgetModel(id: 2, category: ExpenseCategory.food, targetAmount: 1050000);
      final result = await dataSource.read();
      expect(result.last, budget);
    });

    test('DataSource - Update A Budget', () async {
      final budget = BudgetModel(id: 2, category: ExpenseCategory.family, targetAmount: 1000000);
      final result = await dataSource.update(budget);
      expect(result, 1);
    });
  });
}
