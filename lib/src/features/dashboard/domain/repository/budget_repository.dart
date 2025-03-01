import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class BudgetRepository {
  Future<Either<String, int>> create(Budget value);
  Future<Either<String, int>> update(Budget value);
  Future<Either<String, List<Budget>>> read();
  Future<({Budget? budget, String? error})> single(BudgetType type);
}
