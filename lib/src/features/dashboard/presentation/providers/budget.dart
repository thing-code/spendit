import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';

import '../../data/repository/budget_repository_impl.dart';

part 'budget.g.dart';

@Riverpod(keepAlive: true)
class BudgetState extends _$BudgetState {
  @override
  FutureOr<List<Budget>> build() async {
    final result = await ref.read(budgetRepositoryProvider).read();
    return result.fold((l) => [], (r) => r);
  }

  Future<bool> add(Budget budget) async {
    final result = await ref.read(budgetRepositoryProvider).create(budget);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<void> init() async {
    final budgets = await future;
    if (budgets.isEmpty) {
      for (var type in BudgetType.values) {
        final budget = Budget(type: type);

        final result = await ref.read(budgetRepositoryProvider).create(budget);

        result.fold(
          (l) {
            log(l);
          },
          (r) {
            log('Success on ${type.label}');
          },
        );
      }
      ref.invalidateSelf();
    }
  }

  Future<bool> edit(Budget budget) async {
    final result = await ref.read(budgetRepositoryProvider).update(budget);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<void> monthlyReset() async {
    final result = await future;
    for (var data in result) {
      await ref.read(budgetRepositoryProvider).update(data.copyWith(value: 0));
    }
    ref.invalidateSelf();
  }
}
