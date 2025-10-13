import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/core.dart';
import '../../../transactions/domain/models/models.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});

  final Transactions transaction;

  @override
  Widget build(BuildContext context) {
    final name = switch (transaction) {
      Expense(:var notes, :var category) => notes ?? category.title,
      Income(:var notes, :var category) => notes ?? category.title,
      Transfer(:var type) => type.title,
    };

    return Card(
      child: InkResponse(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(12),
          child: IntrinsicHeight(
            child: Row(
              spacing: 12,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: SiColors.primaryContainer,
                  ),
                  child: HugeIcon(icon: HugeIcons.strokeRoundedTarget02),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction.createdAt.cardDate,
                        style: TextStyle(color: SiColors.textSecondary),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 6,
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedMinusSign, size: 12),
                    Text(
                      transaction.amount.currency,
                      style: TextStyle(fontWeight: FontWeight.w600, height: 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkResponse(
        onTap: () {},
        child: Container(
          width: context.screenSize.width * .85,
          padding: const EdgeInsets.all(12.0),
          child: IntrinsicHeight(
            child: Row(
              spacing: 12,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: SiColors.secondaryContainer,
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedTarget02,
                    color: SiColors.secondary,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vespa Matic',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: SiColors.grayscale1,
                              border: Border.all(color: SiColors.grayscale2),
                            ),
                            child: Text('50%', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rp. 16.000.000',
                              style: TextStyle(color: SiColors.textSecondary),
                            ),
                            TextSpan(text: ' / '),
                            TextSpan(
                              text: 'Rp. 32.000.000',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: SiColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionTypeCard extends StatelessWidget {
  const TransactionTypeCard(this.type, {super.key});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final background = switch (type) {
      TransactionType.income => SiColors.primaryContainer,
      TransactionType.expense => SiColors.secondaryContainer,
      _ => SiColors.surface,
    };

    final color = switch (type) {
      TransactionType.income => SiColors.primary,
      TransactionType.expense => SiColors.secondary,
      _ => SiColors.primary,
    };

    final icon = switch (type) {
      TransactionType.income => HugeIcon(
        icon: HugeIcons.strokeRoundedArrowDownLeft01,
        color: context.colorScheme.onPrimary,
        size: 16,
      ),
      TransactionType.expense => HugeIcon(
        icon: HugeIcons.strokeRoundedArrowUpRight01,
        color: context.colorScheme.onSecondary,
        size: 16,
      ),
      _ => HugeIcon(
        icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
        color: context.colorScheme.onPrimary,
        size: 16,
      ),
    };

    final name = switch (type) {
      TransactionType.income => 'Incomes',
      TransactionType.expense => 'Expenses',
      _ => 'Transfers',
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
        border: Border.all(color: SiColors.grayscale1),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: context.textTheme.bodyMedium),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: icon,
              ),
            ],
          ),
          Text(
            'Rp. 50.000.000',
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
