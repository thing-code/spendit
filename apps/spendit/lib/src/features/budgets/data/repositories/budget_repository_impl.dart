import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/budgets/data/datasources/budget_datasource.dart';
import 'package:spendit_remake/src/features/budgets/domain/models/budget_model.dart';
import 'package:spendit_remake/src/features/budgets/domain/repositories/budget_repository.dart';

part 'budget_repository_impl.g.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetDatasource datasource;
  BudgetRepositoryImpl(this.datasource);

  @override
  Future<LocalResponseModel<int>> create(BudgetModel value) async {
    try {
      final result = await datasource.create(value);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<List<BudgetModel>>> read() async  {
    try {
      final result = await datasource.read();
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<int>> update(BudgetModel value) async  {
    try {
      final result = await datasource.update(value);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }
}

@riverpod
BudgetRepository budgetRepository(Ref ref) {
  final datasource = ref.watch(budgetDatasourceProvider);
  return BudgetRepositoryImpl(datasource);
}