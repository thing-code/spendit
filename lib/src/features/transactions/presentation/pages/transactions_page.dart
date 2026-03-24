import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/transactions/presentation/widgets/expense_widget.dart';
import 'package:spendit/src/features/transactions/presentation/widgets/income_widget.dart';

import '../../../../core/core.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: SiAppBar(title: Text('Transactions'), canPop: false),
        body: Column(
          children: [
            TabBar(
              indicator: UnderlineTabIndicator(
                insets: EdgeInsets.symmetric(horizontal: 40),
                borderSide: BorderSide(
                  width: 2,
                  color: context.colorScheme.primary,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              labelStyle: context.textTheme.labelSmall,
              tabs: [
                Tab(text: 'Income'),
                Tab(text: 'Expense'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [IncomeWidget(), ExpenseWidget()]),
            ),
          ],
        ),
      ),
    );
  }
}
