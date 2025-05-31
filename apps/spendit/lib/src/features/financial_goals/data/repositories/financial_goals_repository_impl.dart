import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/financial_goals/data/datasources/financial_goals_data_source.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/repositories/financial_goals_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'financial_goals_repository_impl.g.dart';

class FinancialGoalsRepositoryImpl implements FinancialGoalsRepository {
  final FinancialGoalsDataSource datasource;

  FinancialGoalsRepositoryImpl(this.datasource);

  @override
  Future<LocalResponseModel<int>> addProgress(FinancialGoalProgressModel progress) async {
    try {
      final result = await datasource.addProgress(progress);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<int>> create(FinancialGoalModel goal) async {
    try {
      final result = await datasource.create(goal);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<int>> delete(int id) async {
    try {
      final result = await datasource.delete(id);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<List<FinancialGoalModel>>> read() async {
    try {
      final result = await datasource.read();
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<int>> update(FinancialGoalModel goal) async {
    try {
      final result = await datasource.update(goal);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }
}

@riverpod
FinancialGoalsRepository financialGoalsRepository(Ref ref) {
  final datasource = ref.watch(financialGoalsDataSourceProvider);
  return FinancialGoalsRepositoryImpl(datasource);
}
