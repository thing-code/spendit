import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

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
          spacing: 16,
          children: [
            // * Balance
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
            Column(
              spacing: 12,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Transactions',
                      style: context.textTheme.labelMedium,
                    ),
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
                Column(
                  spacing: 8,
                  children: List.generate(3, (index) => TransactionCard()),
                ),
                AspectRatio(
                  aspectRatio: 4 / 2,
                  child: Card(
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedSearchList02,
                          size: 56,
                        ),
                        Text('No Recent Transactions'),
                      ],
                    ),
                  ),
                ),
              ],
            ).paddingSymmetric(h: 16),
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
