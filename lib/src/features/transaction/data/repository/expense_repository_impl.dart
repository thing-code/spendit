import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/common.dart';
import '../../domain/repository/expense_repository.dart';
import '../datasource/expense_datasource.dart';

part 'expense_repository_impl.g.dart';

@riverpod
ExpenseRepositoryImpl expenseRepository(Ref ref) {
  final datasource = ref.watch(expenseDatasourceProvider);
  return ExpenseRepositoryImpl(datasource);
}

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDatasource datasource;

  ExpenseRepositoryImpl(this.datasource);

  @override
  Future<Either<String, int>> create(Expense expense) async {
    try {
      final result = await datasource.create(expense);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> delete(Expense expense) async {
    try {
      final result = await datasource.delete(expense);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Expense>>> read() async {
    try {
      final result = await datasource.read();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> update(Expense expense) async {
    try {
      final result = await datasource.update(expense);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Expense>>> readByMonth(DateTime date) async {
    try {
      final result = await datasource.readByMonth(date);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
