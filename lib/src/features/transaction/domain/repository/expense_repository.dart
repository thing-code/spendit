import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class ExpenseRepository {
  Future<Either<String, int>> create(ExpenseModel expense);
  Future<Either<String, int>> update(ExpenseModel expense);
  Future<Either<String, int>> delete(ExpenseModel expense);
  Future<Either<String, List<ExpenseModel>>> read();
}
