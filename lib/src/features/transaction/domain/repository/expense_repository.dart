import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class ExpenseRepository {
  Future<Either<String, int>> create(Expense value);
  Future<Either<String, int>> update(Expense value);
  Future<Either<String, int>> delete(Expense value);
  Future<Either<String, List<Expense>>> read();
  Future<Either<String, List<Expense>>> readByMonth(DateTime date);
}
