import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/income_model.dart';
import '../../domain/repository/income_repository.dart';
import '../datasource/income_datasource.dart';

part 'income_repository_impl.g.dart';

@riverpod
IncomeRepository incomeRepository(Ref ref) {
  final datasource = ref.watch(incomeDataSourceProvider);
  return IncomeRepositoryImpl(datasource);
}

class IncomeRepositoryImpl implements IncomeRepository {
  final IncomeDatasource datasource;

  IncomeRepositoryImpl(this.datasource);

  @override
  Future<Either<String, int>> create(IncomeModel income) async {
    try {
      final result = await datasource.create(income);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> delete(IncomeModel income) async {
    try {
      final result = await datasource.delete(income);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<IncomeModel>>> read() async {
    try {
      final result = await datasource.read();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> update(IncomeModel income) async {
    try {
      final result = await datasource.update(income);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
