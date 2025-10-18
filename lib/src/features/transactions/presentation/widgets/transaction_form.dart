import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../home/presentation/providers/balance_provider.dart';

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
                  TransactionType.income => Icon(
                    Amicons.lucide_arrow_down_left,
                  ),
                  TransactionType.expense => Icon(
                    Amicons.lucide_arrow_up_right,
                  ),
                  TransactionType.goals => Icon(Amicons.lucide_goal),
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
      body: Column(
        spacing: 16,
        children: [
          TextField(),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: SiColors.card),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: SiColors.primary),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: SiColors.danger),
              ),
              filled: false,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SiButton.primary(
            onPressed: () {},
            text: 'Add Transaction',
            icon: Icon(Amicons.lucide_plus),
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
