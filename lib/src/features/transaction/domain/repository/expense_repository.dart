import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class ExpenseRepository {
  Future<Either<String, int>> create(Expense expense);
  Future<Either<String, int>> update(Expense expense);
  Future<Either<String, int>> delete(Expense expense);
  Future<Either<String, List<Expense>>> read();
  Future<Either<String, List<Expense>>> readByMonth(DateTime date);
}
