import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class IncomeRepository {
  Future<Either<String, int>> create(Income income);
  Future<Either<String, int>> update(Income income);
  Future<Either<String, int>> delete(Income income);
  Future<Either<String, List<Income>>> read();
}
