import 'package:flutter_test/flutter_test.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/features/transactions/data/datasources/transaction_data_source.dart';
import 'package:spendit/src/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:spendit/src/features/transactions/domain/models/transaction_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late TransactionDataSourceImpl dataSource;
  late TransactionRepositoryImpl repository;

  setUpAll(() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await db.execute(SqlCommand.executeTransactionTable);
    dataSource = TransactionDataSourceImpl(db);
    repository = TransactionRepositoryImpl(dataSource);
  });

  tearDownAll(() async {
    await db.close();
  });

  group('TransactionRepository Test', () {
    final month = DateTime(2025, 6, 1);
    final expense = TransactionModel.expense(
      id: 1,
      category: ExpenseCategory.food,
      description: 'expense',
      amount: 200000,
      date: month,
    );
    final income = TransactionModel.income(
      id: 2,
      description: 'income',
      amount: 200000,
      date: month,
    );

    test('Create Expense', () async {
      final result = await repository.create(expense);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });
    test('Create Income', () async {
      final result = await repository.create(income);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(2));
    });

    test('Read All Transactions', () async {
      final result = await repository.read();
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess([expense, income]));
    });

    test('Read Expenses', () async {
      final result = await repository.readByType(TransactionType.expense);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess([expense]));
    });

    test('Read Incomes', () async {
      final result = await repository.readByType(TransactionType.income);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess([income]));
    });

    test('Read By Month', () async {
      final result = await repository.readByMonth(month);
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess([expense, income]));
    });

    test('Update Expense', () async {
      final result = await repository.update(expense.copyWith(amount: 300000));
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });

    test('Update Income', () async {
      final result = await repository.update(income.copyWith(amount: 300000));
      expect(result, isA<LocalResponseSuccess>());
      expect(result, LocalResponseSuccess(1));
    });
  });
}
