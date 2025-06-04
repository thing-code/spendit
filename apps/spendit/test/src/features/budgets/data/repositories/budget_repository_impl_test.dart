import 'package:flutter_test/flutter_test.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/features/budgets/data/datasources/budget_data_source.dart';
import 'package:spendit/src/features/budgets/data/repositories/budget_repository_impl.dart';
import 'package:spendit/src/features/budgets/domain/models/budget_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late BudgetDataSourceImpl dataSource;
  late BudgetRepositoryImpl repository;

  setUpAll(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await db.execute(SqlCommand.executeBudgetTable);
    dataSource = BudgetDataSourceImpl(db);
    repository = BudgetRepositoryImpl(dataSource);
  });

  tearDownAll(() async {
    await db.close();
  });

  group('BudgetRepository Test', () {
    final budget = BudgetModel(id: 1, category: ExpenseCategory.food, targetAmount: 100000);
    test('Create Budget', () async {
      final result = await repository.create(budget);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });

    test('Read Budget', () async {
      final result = await repository.read();
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess([budget]));
    });

    test('Update Budget', () async {
      final result = await repository.update(budget);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });
  });
}
