import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/data/repositories/transactions_repository.dart';
import 'package:spendit/src/features/transactions/data/sources/transactions_data_source.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';

class MockTransactionsDataSource extends Mock
    implements TransactionsDataSource {}

class FakeIncome extends Fake implements Income {}

class FakeExpense extends Fake implements Expense {}

void main() {
  group('Transactions Repository Test', () {
    late MockTransactionsDataSource mockDataSource;
    late TransactionsRepository repository;

    setUp(() {
      registerFallbackValue(FakeIncome());
      registerFallbackValue(FakeExpense());
      mockDataSource = MockTransactionsDataSource();
      repository = TransactionsRepositoryImpl(mockDataSource);
    });

    group('Insert Transaction', () {
      test('Should insert income successfully', () async {
        final income = Income(
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );

        when(() => mockDataSource.create(any())).thenAnswer((_) async => 1);

        final result = await repository.create(income);

        expect(result, 1);

        verify(() => mockDataSource.create(any())).called(1);
      });

      test('Should insert expense successfully', () async {
        final expense = Expense(
          amount: 25000,
          category: ExpenseCategory.food,
          notes: 'Beli Nasi Padang',
          createdAt: DateTime.now(),
        );

        when(() => mockDataSource.create(any())).thenAnswer((_) async => 1);

        final result = await repository.create(expense);

        expect(result, 1);

        verify(() => mockDataSource.create(any())).called(1);
      });
    });

    group('Get Transactions', () {
      test('Should return transaction with spesific id', () async {
        final income = Income(
          id: 1,
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
        );

        when(() => mockDataSource.getById(1)).thenAnswer((_) async => income);

        final result = await repository.getById(1);

        expect(result, isA<Transactions>());
        expect(result, isA<Income>());
        expect(result?.id, 1);

        verify(() => mockDataSource.getById(1)).called(1);
      });

      test('Should return null when transaction not found', () async {
        when(
          () => mockDataSource.getById(100),
        ).thenAnswer((invocation) async => null);

        final result = await repository.getById(100);

        expect(result, isNull);

        verify(() => mockDataSource.getById(100)).called(1);
      });

      test('Should get all transactions', () async {
        final transactions = [
          Income(
            id: 1,
            amount: 5000000,
            category: IncomeCategory.salary,
            notes: 'Gajian Bulan Oktober',
            createdAt: DateTime.now(),
          ),
          Expense(
            id: 2,
            amount: 25000,
            category: ExpenseCategory.food,
            notes: 'Beli Nasi Padang',
            createdAt: DateTime.now(),
          ),
        ];

        when(
          () => mockDataSource.getAll(),
        ).thenAnswer((invocation) async => transactions);

        final result = await repository.getAll();

        expect(result, isA<List<Transactions>>());
        expect(result.length, 2);

        verify(() => mockDataSource.getAll()).called(1);
      });
    });

    group('Update Transactions', () {
      test('Should update transaction', () async {
        final income = Income(
          id: 1,
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(
          () => mockDataSource.update(1, any()),
        ).thenAnswer((invocation) async => 1);

        await expectLater(repository.update(1, income), completes);

        verify(() => mockDataSource.update(1, any())).called(1);
      });
    });

    group('Delete Transactions', () {
      test('Should delete transaction', () async {
        final income = Income(
          id: 1,
          amount: 5000000,
          category: IncomeCategory.salary,
          notes: 'Gajian Bulan Oktober',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        when(
          () => mockDataSource.getById(1),
        ).thenAnswer((invocation) async => income);

        when(
          () => mockDataSource.delete(1),
        ).thenAnswer((invocation) async => 1);

        await expectLater(repository.delete(1), completes);

        verify(() => mockDataSource.delete(1)).called(1);
      });
    });
  });
}
