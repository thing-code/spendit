import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CircularProgressIndicator(
                value: .7,
                strokeWidth: 8,
                constraints: BoxConstraints(minHeight: 80, minWidth: 80),
              ),
            ),
            Column(
              children: [
                Gap(2),
                Text('Terpakai'),
                Gap(2),
                Text(
                  usages.toDouble().toRupiahCompact,
                  style: SpendItTextStyles.medium.copyWith(
                    fontSize: 10,
                    color: SpendItColors.primaryColor.shade200,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Anggaran Bulanan'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      budgets.toDouble().toRupiahCompact,
                      style: SpendItTextStyles.bold.copyWith(fontSize: 18),
                    ),
                    Icon(Iconsax.arrow_right_3_copy, color: SpendItColors.accentColor),
                  ],
                ),
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
