import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class IncomeRepository {
  Future<Either<String, int>> create(IncomeModel income);
  Future<Either<String, int>> update(IncomeModel income);
  Future<Either<String, int>> delete(IncomeModel income);
  Future<Either<String, List<IncomeModel>>> read();
}
