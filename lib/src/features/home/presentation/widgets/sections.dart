import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/presentation/providers/transactions_provider.dart';

import '../../../transactions/domain/models/models.dart';
import 'widgets.dart';

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          'Balance',
          style: TextStyle(fontSize: 16, color: SiColors.textSecondary),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rp 1.000.000',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: HugeIcon(icon: HugeIcons.strokeRoundedView),
            ),
          ],
        ),
      ],
    );
  }
}

class RecentTransactionsSection extends ConsumerWidget {
  const RecentTransactionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionProvider);

    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Transactions', style: context.textTheme.labelMedium),
            InkWell(
              onTap: () => TransactionRoute().push(context),
              child: Row(
                spacing: 4,
                children: [
                  Text(
                    'See All',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowRight01,
                    size: 16,
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        switch (transactions) {
          AsyncData(:var value) => _onData(value),
          AsyncError(:var error) => Center(child: Text(error.toString())),
          _ => Center(child: CircularProgressIndicator()),
        },
      ],
    ).paddingSymmetric(h: 16);
  }

  Widget _onData(List<Transactions> data) {
    if (data.isEmpty) {
      return AspectRatio(
        aspectRatio: 4 / 2,
        child: Card(
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HugeIcon(icon: HugeIcons.strokeRoundedSearchList02, size: 56),
              Text('No Recent Transactions'),
            ],
          ),
        ),
      );
    }

    return Column(
      spacing: 8,
      children: List<Transactions>.from(
        data.take(5),
      ).map((t) => TransactionCard(transaction: t)).toList(),
    );
  }
}
