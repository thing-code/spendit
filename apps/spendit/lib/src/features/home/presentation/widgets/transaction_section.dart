import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_statistic_card.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionSection extends ConsumerWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text('Statistik', style: SiTextStyles.regular.copyWith(fontSize: 16)),
          Row(
            spacing: 12,
            children: [
              Expanded(child: TransactionStatisticCard(TransactionType.income)),
              Expanded(child: TransactionStatisticCard(TransactionType.expense)),
            ],
          ),
        ],
      ),
    );
  }
}
