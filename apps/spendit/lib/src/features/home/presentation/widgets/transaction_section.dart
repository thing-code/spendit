import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/widgets/budget_statistic_card.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_statistic_card.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionSection extends ConsumerWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text('Statistik', style: SITextStyles.regular.copyWith(fontSize: 16)),
                TransactionStatisticCard(TransactionType.income),
                TransactionStatisticCard(TransactionType.expense),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text('Anggaran', style: SITextStyles.regular.copyWith(fontSize: 16)),
                BudgetStatisticCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
