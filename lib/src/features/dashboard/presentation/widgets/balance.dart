import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/common/common.dart';

class MyBalance extends StatelessWidget {
  const MyBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.primaryContainer.withValues(alpha: .8),
            context.colorScheme.primaryContainer.withValues(alpha: .4),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Balance',
                  style: kRegularTextStyle.copyWith(
                    fontSize: 18,
                    color: context.colorScheme.primary.withValues(alpha: .6),
                  ),
                ),
                Text(1500000.currency, style: kBoldTextStyle.copyWith(fontSize: 28)),
              ],
            ),
          ),
          Gap(12),
          Container(
            constraints: BoxConstraints(maxWidth: context.deviceSize.width),
            child: Row(
              spacing: 12,
              children: [
                Expanded(child: TransactionFlowCard(type: TransactionType.income, value: 1000000)),
                Expanded(child: TransactionFlowCard(type: TransactionType.expense, value: 1000000)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionFlowCard extends StatelessWidget {
  const TransactionFlowCard({super.key, required this.value, required this.type});

  final TransactionType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    final title = switch (type) {
      TransactionType.expense => 'Expense',
      TransactionType.income => 'Income',
    };

    final symbol = switch (type) {
      TransactionType.expense => '-',
      TransactionType.income => '+',
    };

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(50),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 8,
          children: [
            Text(
              title,
              style: kMediumTextStyle.copyWith(
                color: context.colorScheme.primary.withValues(alpha: .6),
              ),
            ),
            Text(
              '$symbol ${value.currency}',
              style: kBoldTextStyle.copyWith(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
