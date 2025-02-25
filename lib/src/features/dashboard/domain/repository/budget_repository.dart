import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class BudgetRepository {
  Future<Either<String, int>> create(Budget budget);
  Future<Either<String, int>> update(Budget budget);
  Future<Either<String, List<Budget>>> read();
}