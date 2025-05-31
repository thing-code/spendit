import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/financial_goals/data/repositories/financial_goals_repository_impl.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_model.dart';

part 'financial_goals_controller.g.dart';

@riverpod
class FinancialGoalsController extends _$FinancialGoalsController {
  @override
  FutureOr<List<FinancialGoalModel>> build() async {
    final result = await ref.read(financialGoalsRepositoryProvider).read();
    return switch (result) {
      LocalResponseSuccess(:final data) => data,
      LocalResponseFailure() => [],
    };
  }

  Future<bool> add(FinancialGoalModel goal) async {
    final result = await ref.read(financialGoalsRepositoryProvider).create(goal);
    ref.invalidateSelf();
    return switch (result) {
      LocalResponseSuccess() => true,
      LocalResponseFailure() => false,
    };
  }

  Future<bool> edit(FinancialGoalModel goal) async {
    final result = await ref.read(financialGoalsRepositoryProvider).update(goal);
    ref.invalidateSelf();
    return switch (result) {
      LocalResponseSuccess() => true,
      LocalResponseFailure() => false,
    };
  }

  Future<bool> delete(int id) async {
    final result = await ref.read(financialGoalsRepositoryProvider).delete(id);
    ref.invalidateSelf();
    return switch (result) {
      LocalResponseSuccess() => true,
      LocalResponseFailure() => false,
    };
  }

  Future<bool> addProgress(FinancialGoalProgressModel progress) async {
    final result = await ref.read(financialGoalsRepositoryProvider).addProgress(progress);
    ref.invalidateSelf();
    return switch (result) {
      LocalResponseSuccess() => true,
      LocalResponseFailure() => false,
    };
  }
}
