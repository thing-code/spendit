import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/transactions/data/datasources/transaction_data_source.dart';
import 'package:spendit_remake/src/features/transactions/domain/models/transaction_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockTransactionDataSource extends Mock implements TransactionDataSource {}

void main() {
  late TransactionDataSource dataSource;

  setUp(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    dataSource = MockTransactionDataSource();

    registerFallbackValue(
      TransactionExpense(
        id: 1,
        category: ExpenseCategory.food,
        description: 'expense',
        amount: 200000,
        date: DateTime.now(),
      ),
    );
    registerFallbackValue(
      TransactionIncome(id: 2, description: 'income', amount: 200000, date: DateTime.now()),
    );
    registerFallbackValue(TransactionType.expense);
    registerFallbackValue(TransactionType.income);
    registerFallbackValue(DateTime(2025, 6));
  });

  group('DataSource Test', () {
    final expense = TransactionExpense(
      id: 1,
      category: ExpenseCategory.food,
      description: 'expense',
      amount: 200000,
      date: DateTime.now(),
    );
    final income = TransactionIncome(
      id: 2,
      description: 'income',
      amount: 200000,
      date: DateTime.now(),
    );
    final month = DateTime(2025, 6);

    test('Create Expense', () async {
      when(() => dataSource.create(any())).thenAnswer((_) async => 1);
      final result = await dataSource.create(expense);
      expect(result, 1);
      verify(() => dataSource.create(expense)).called(1);
      verifyNoMoreInteractions(dataSource);
    });
    test('Create Income', () async {
      when(() => dataSource.create(any())).thenAnswer((_) async => 2);
      final result = await dataSource.create(income);
      expect(result, 2);
      verify(() => dataSource.create(income)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Read All Transactions', () async {
      when(() => dataSource.read()).thenAnswer((_) async => [expense, income]);
      final result = await dataSource.read();
      expect(result, [expense, income]);
      verify(() => dataSource.read()).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Read Expenses', () async {
      when(() => dataSource.readByType(any())).thenAnswer((_) async => [expense]);
      final result = await dataSource.readByType(TransactionType.expense);
      expect(result, [expense]);
      verify(() => dataSource.readByType(TransactionType.expense)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Read Incomes', () async {
      when(() => dataSource.readByType(any())).thenAnswer((_) async => [income]);
      final result = await dataSource.readByType(TransactionType.income);
      expect(result, [income]);
      verify(() => dataSource.readByType(TransactionType.income)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Read By Month', () async {
      when(() => dataSource.readByMonth(any())).thenAnswer((_) async => [expense, income]);
      final result = await dataSource.readByMonth(month);
      expect(result, [expense, income]);
      verify(() => dataSource.readByMonth(month)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Update Expense', () async {
      when(() => dataSource.update(any())).thenAnswer((_) async => 1);
      final result = await dataSource.update(expense);
      expect(result, 1);
      verify(() => dataSource.update(expense)).called(1);
      verifyNoMoreInteractions(dataSource);
    });

    test('Update Income', () async {
      when(() => dataSource.update(any())).thenAnswer((_) async => 2);
      final result = await dataSource.update(income);
      expect(result, 2);
      verify(() => dataSource.update(income)).called(1);
      verifyNoMoreInteractions(dataSource);
    });
  });
}
