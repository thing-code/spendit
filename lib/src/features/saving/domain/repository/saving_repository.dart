import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class SavingRepository {
  Future<Either<String, int>> create(SavingModel saving);
  Future<Either<String, int>> update(SavingModel saving);
  Future<Either<String, int>> delete(SavingModel saving);
  Future<Either<String, List<SavingModel>>> read();
}

abstract class PlannedSavingRepository {
  double? get value;
  void save(double val);
}
