import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/saving.dart';
import '../../domain/repository/saving_repository.dart';
import '../datasource/saving_datasource.dart';

part 'saving_repository_impl.g.dart';

@riverpod
SavingRepository savingRepository(Ref ref) {
  final datasource = ref.watch(savingDatasourceProvider);
  return SavingRepositoryImpl(datasource);
}

class SavingRepositoryImpl implements SavingRepository {
  final SavingDatasource datasource;

  SavingRepositoryImpl(this.datasource);

  @override
  Future<Either<String, int>> create(Saving saving) async {
    try {
      final result = await datasource.create(saving);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> delete(Saving saving) async {
    try {
      final result = await datasource.delete(saving);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Saving>>> read() async {
    try {
      final result = await datasource.read();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> update(Saving saving) async {
    try {
      final result = await datasource.update(saving);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
  
  @override
  Future<Either<String, List<Saving>>> readByMonth(DateTime date) async {
    try {
      final result = await datasource.readByMonth(date);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
