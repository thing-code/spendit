import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: _homeAppBar,
        body: Column(
          spacing: 24,
          children: [
            // * Total Transactions
            Column(
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TransactionTypeCard(TransactionType.income),
                    ),
                    Expanded(
                      child: TransactionTypeCard(TransactionType.expense),
                    ),
                  ],
                ).paddingSymmetric(h: 16),
              ],
            ),
            // * Recent Transactions
            RecentTransactionsSection(),
          ],
        ),
      ),
    );
  }

  List<Widget> _homeAppBar(BuildContext context, _) {
    return [
      SliverAppBar(
        pinned: true,
        floating: true,
        title: Text('Welcome Back!'),
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: kToolbarHeight + context.viewPadding.top,
            ),
            child: BalanceSection(),
          ),
        ),
        expandedHeight: context.screenSize.height * .15,
      ),
    ];
  }
}
