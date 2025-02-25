import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import 'budget_card.dart';

class MonthlyBudget extends StatelessWidget {
  const MonthlyBudget({super.key});

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
        return BudgetCard(type: BudgetType.values[index], value: 1000000);
      },
    );
  }
}
