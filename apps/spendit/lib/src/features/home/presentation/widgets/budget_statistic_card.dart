import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/features/budgets/presentation/controllers/budget_controller.dart';
import 'package:spendit_core/spendit_core.dart';

class BudgetStatisticCard extends ConsumerWidget {
  const BudgetStatisticCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final budgets = ref.watch(
      budgetControllerProvider.select(
        (value) => (value.value ?? []).fold(0, (p, e) => p + e.targetAmount),
      ),
    );
    final usages = ref.watch(
      budgetControllerProvider.select(
        (value) => (value.value ?? []).fold(0, (p, e) => p + e.currentAmount),
      ),
    );
    double chartValue = budgets > 0 ? usages / budgets : 0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CircularProgressIndicator(
                        value: chartValue,
                        strokeWidth: 12,
                        trackGap: 8,
                        constraints: BoxConstraints(
                          minHeight: context.deviceWidth * .24,
                          minWidth: context.deviceWidth * .24,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        'Terpakai',
                        style: SiTextStyles.medium.copyWith(
                          fontSize: 14,
                          color: SiColors.mutedText,
                        ),
                      ),
                      Text(
                        usages.toDouble().toRupiahCompact,
                        style: SiTextStyles.medium.copyWith(fontSize: 16, color: SiColors.text),
                      ),
                      Gap(2),
                      Text(
                        'Pengeluaran Teratas',
                        style: SiTextStyles.medium.copyWith(
                          fontSize: 14,
                          color: SiColors.mutedText,
                        ),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ExpenseCategory.food.color,
                              border: Border.all(
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignInside,
                                color: SiColors.text.withValues(alpha: .5),
                              ),
                            ),
                          ),
                          Text(ExpenseCategory.food.label),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anggaran Bulanan',
                      style: SiTextStyles.regular.copyWith(fontSize: 16, color: SiColors.mutedText),
                    ),
                    Text(
                      budgets.toDouble().toRupiahCompact,
                      style: SiTextStyles.bold.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                Icon(IconsaxPlusLinear.arrow_right_3, color: SiColors.mutedText),
              ],
            ),
          ],
        ),
      ),
    ).onTap(
      onTap: () {
        Toast.show(context, title: 'THIS IS A TEST TOAST');
      },
    );
  }
}
