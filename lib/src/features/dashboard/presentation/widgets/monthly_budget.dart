import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/dashboard/presentation/providers/budget.dart';

import '../../../../common/common.dart';
import 'budget_card.dart';

class MonthlyBudget extends ConsumerWidget {
  const MonthlyBudget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(budgetStateProvider);

    return switch (data) {
      AsyncData(:final value) => _MonthlyBudgetData(value),
      AsyncError(:final error) => _MonthlyBudgetError(error),
      _ => _MonthlyBudgetLoading(),
    };
  }
}

class _MonthlyBudgetData extends StatelessWidget {
  const _MonthlyBudgetData(this.budgets);

  final List<Budget> budgets;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: BudgetType.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final budget = budgets[index];
        return BudgetCard(budget: budget,);
      },
    );
  }
}

class _MonthlyBudgetLoading extends StatelessWidget {
  const _MonthlyBudgetLoading();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
  }
}

class _MonthlyBudgetError extends StatelessWidget {
  const _MonthlyBudgetError(this.error);

  final Object error;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Center(child: Text('Error: $error')));
  }
}
