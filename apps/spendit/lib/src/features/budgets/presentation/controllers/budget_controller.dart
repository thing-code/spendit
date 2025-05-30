import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/budgets/data/repositories/budget_repository_impl.dart';
import 'package:spendit_remake/src/features/budgets/domain/models/budget_model.dart';

part 'budget_controller.g.dart';

@Riverpod(keepAlive: true)
class BudgetController extends _$BudgetController {
  @override
  FutureOr<List<BudgetModel>> build() async {
    final result = await ref.read(budgetRepositoryProvider).read();
    return switch (result) {
      LocalResponseSuccess(:final data) => data,
      LocalResponseFailure() => [],
    };
  }

  Future<void> init() async {
    if (state.value?.isEmpty ?? true) {
      return;
    }

    for (var category in ExpenseCategory.values) {
      final budget = BudgetModel(category: category);

      final result = await ref.read(budgetRepositoryProvider).create(budget);

      if (result is LocalResponseFailure) {
        continue;
      }
    }

    ref.invalidateSelf();
  }

  Future<bool> edit(BudgetModel budget) async {
    final result = await ref.read(budgetRepositoryProvider).update(budget);
    ref.invalidateSelf();
    return result is LocalResponseSuccess;
  }

  Future<bool> usage(ExpenseCategory category, int amount) async {
    final budgets = await future;
    final budget = budgets.firstWhere((element) => element.category == category);
    final result = await ref
        .read(budgetRepositoryProvider)
        .update(budget.copyWith(currentAmount: budget.currentAmount + amount));
    ref.invalidateSelf();
    return result is LocalResponseSuccess;
  }

  Future<void> reset() async {
    final budgets = await future;
    for (var budget in budgets) {
      await ref.read(budgetRepositoryProvider).update(budget.copyWith(currentAmount: 0));
    }
    ref.invalidateSelf();
  }
}
