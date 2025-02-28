
import '../../../../common/common.dart';
import '../providers/budget.dart';
import 'budget_card.dart';

class COSMonthlyBudget extends ConsumerWidget {
  const COSMonthlyBudget({super.key});

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
      itemCount: budgets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final budget = budgets[index];
        return BudgetCard(budget: budget);
      },
    );
  }
}

class _MonthlyBudgetLoading extends StatelessWidget {
  const _MonthlyBudgetLoading();

  @override
  Widget build(BuildContext context) {
    final budgets = List.generate(
      BudgetType.values.length,
      (index) => Budget(type: BudgetType.values[index]),
    );
    return SliverGrid.builder(
      itemCount: budgets.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final budget = budgets[index];
        return BudgetCard(budget: budget).skeleton();
      },
    );
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
