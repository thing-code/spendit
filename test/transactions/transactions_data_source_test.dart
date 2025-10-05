import 'package:flutter_test/flutter_test.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/data/sources/transactions_data_source.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('Transactions Data Source Test', () {
    late Database database;
    late TransactionsDataSource dataSource;

    setUp(() async {
      database = await openDatabase(
        inMemoryDatabasePath,
        version: 2,
        onCreate: (db, version) async {
          await db.execute(SqlCommand.executeTransactionTable);
        },
      );
      dataSource = TransactionsDataSourceImpl(Future.value(database));
    });

    tearDown(() async {
      await database.close();
    });

    group('Insert Transaction', () {
      test('Should insert income and return id', () async {
        final income = Income(
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );

        SiLogger.json(income.toJson());

        final id = await dataSource.create(income);

        expect(id, greaterThan(0));
      });

      test('Should insert expense and return id', () async {
        final expense = Expense(
          amount: 25000,
          category: ExpenseCategory.food,
          notes: 'Beli Nasi Padang',
          createdAt: DateTime.now(),
        );

        SiLogger.json(expense.toJson());

        final id = await dataSource.create(expense);

        expect(id, greaterThan(0));
      });
    });

    group('Query Transactions', () {
      final income = Income(
        amount: 5000000,
        category: IncomeCategory.salary,
        notes: 'Gajian Bulan Oktober',
        createdAt: DateTime.now(),
      );

      final expense = Expense(
        amount: 25000,
        category: ExpenseCategory.food,
        notes: 'Beli Nasi Padang',
        createdAt: DateTime.now(),
      );

      setUp(() async {
        await dataSource.create(income);
        await dataSource.create(expense);
      });

      test('Should get all transactions', () async {
        final transactions = await dataSource.getAll();

        SiLogger.json(transactions);

        expect(transactions.length, 2);
      });

      test('Should get transaction with id', () async {
        final transaction = await dataSource.getById(1);

        SiLogger.json(transaction);

        expect(transaction?.id, 1);
      });

      test('Should get expense transactions', () async {
        final transactions = await dataSource.getByFilter(
          type: TransactionType.expense,
        );

        SiLogger.json(transactions);

        expect(transactions.length, 1);
      });

      test('Should get income transactions', () async {
        final transactions = await dataSource.getByFilter(
          type: TransactionType.income,
        );

        SiLogger.json(transactions);

        expect(transactions.length, 1);
      });
    });

    group('Update Transaction', () {
      test('Should update transaction and return affected row', () async {
        final income = Income(
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );
        final id = await dataSource.create(income);

        final row = await dataSource.update(
          id,
          income.copyWith(id: id, amount: 1000000, updatedAt: DateTime.now()),
        );

        expect(row, 1);

        final updated = await dataSource.getById(id);

        SiLogger.json(updated);

        expect(updated?.amount, 1000000);
      });
    });

    group('Delete Transaction', () {
      test('Should delete transaction and return affected row', () async {
        final income = Income(
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );
        final id = await dataSource.create(income);

        final row = await dataSource.delete(id);

        expect(row, 1);

        final updated = await dataSource.getById(id);

        expect(updated, isNull);
      });
    });
  });
}
