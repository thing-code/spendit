import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/saving_model.dart';
import '../../domain/repository/saving_repository.dart';
import '../datasource/planned_saving_datasource.dart';
import '../datasource/saving_datasource.dart';

part 'saving_repository_impl.g.dart';

@riverpod
SavingRepository savingRepository(Ref ref) {
  final datasource = ref.watch(savingDataSourceProvider);
  return SavingRepositoryImpl(datasource);
}

class SavingRepositoryImpl implements SavingRepository {
  final SavingDatasource datasource;

  SavingRepositoryImpl(this.datasource);

  @override
  Future<Either<String, int>> create(SavingModel saving) async {
    try {
      final result = await datasource.create(saving);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> delete(SavingModel saving) async {
    try {
      final result = await datasource.delete(saving);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SavingModel>>> read() async {
    try {
      final result = await datasource.read();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> update(SavingModel saving) async {
    try {
      final result = await datasource.update(saving);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

@riverpod
PlannedSavingRepository plannedSavingRepository(Ref ref) {
  final datasource = ref.watch(plannedSavingDataSourceProvider);
  return PlannedSavingRepositoryImpl(datasource);
}

class PlannedSavingRepositoryImpl implements PlannedSavingRepository {
  final PlannedSavingDatasource datasource;

  PlannedSavingRepositoryImpl(this.datasource);

  @override
  double? get value => datasource.value;

  @override
  void save(double val) {
    datasource.save(val);
  }
}
