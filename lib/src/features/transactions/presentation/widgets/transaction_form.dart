import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/home/presentation/providers/balance_provider.dart';

Future<bool?> showTransactionForm(BuildContext context) =>
    showCupertinoSheet<bool>(
      context: context,
      builder: (context) => TransactionFormWidget(),
    );

/// Main Transaction Form
class TransactionFormWidget extends ConsumerWidget {
  const TransactionFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);

    return DefaultTabController(
      length: TransactionType.values.length,
      child: Scaffold(
        appBar: SiAppBar(title: Text('New Transaction')),
        body: Column(
          spacing: 16,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                spacing: 4,
                children: [
                  Text(
                    (balance.value ?? 0).currency,
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    'Current Balance',
                    style: TextStyle(color: SiColors.textSecondary),
                  ),
                ],
              ),
            ),
            TabBar(
              labelStyle: context.textTheme.labelSmall,
              tabs: TransactionType.values.map((type) {
                final icon = switch (type) {
                  TransactionType.expense => HugeIcon(
                    icon: HugeIcons.strokeRoundedCircleArrowUpRight02,
                  ),
                  TransactionType.income => HugeIcon(
                    icon: HugeIcons.strokeRoundedCircleArrowDownLeft,
                  ),
                  TransactionType.goals => HugeIcon(
                    icon: HugeIcons.strokeRoundedTarget01,
                  ),
                };
                return Tab(
                  text: type.title,
                  icon: icon,
                  iconMargin: EdgeInsets.all(4),
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TransactionIncomeForm(),
                  TransactionExpenseForm(),
                  TransactionGoalsForm(),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}

/// * Transaction Income Form
class TransactionIncomeForm extends ConsumerWidget {
  const TransactionIncomeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(spacing: 16, children: [TextField(), TextField()]),
      bottomNavigationBar: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SiButton.primary(
            onPressed: () {},
            text: 'Add Transaction',
            icon: HugeIcon(icon: HugeIcons.strokeRoundedPlusSign),
          ),
        ),
      ),
    );
  }
}

/// * Transaction Expense Form
class TransactionExpenseForm extends ConsumerWidget {
  const TransactionExpenseForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Text('Expense'));
  }
}

/// * Transaction Goals Form
class TransactionGoalsForm extends ConsumerWidget {
  const TransactionGoalsForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Text('Goals'));
  }
}
