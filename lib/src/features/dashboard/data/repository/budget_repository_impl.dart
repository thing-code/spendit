import 'package:fpdart/fpdart.dart';

import '../../../../common/common.dart';
import '../../domain/repository/budget_repository.dart';
import '../datasource/budget_datasource.dart';

part 'budget_repository_impl.g.dart';

@riverpod
BudgetRepository budgetRepository(Ref ref) {
  final datasource = ref.watch(budgetDatasourceProvider);
  return BudgetRepositoryImpl(datasource);
}

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetDatasource datasource;

  BudgetRepositoryImpl(this.datasource);

  @override
  Future<Either<String, int>> create(Budget budget) async {
    try {
      final result = await datasource.create(budget);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Budget>>> read() async {
    try {
      final result = await datasource.read();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> update(Budget budget) async {
    try {
      final result = await datasource.create(budget);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<({Budget? budget, String? error})> single(BudgetType type) async {
    try {
      final budget = await datasource.single(type);
      return (budget: budget, error: null);
    } catch (e) {
      return (budget: null, error: e.toString());
    }
  }
}
