import 'package:fpdart/fpdart.dart';
import 'package:spendit/src/common/common.dart';

abstract class SavingRepository {
  Future<Either<String, int>> create(Saving saving);
  Future<Either<String, int>> update(Saving saving);
  Future<Either<String, int>> delete(Saving saving);
  Future<Either<String, List<Saving>>> read();
}

abstract class PlannedSavingRepository {
  double? get value;
  void save(double val);
}
