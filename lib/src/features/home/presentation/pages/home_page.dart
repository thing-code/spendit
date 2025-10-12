import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(title: Text('Welcome Back!')),
      bottomNavigationBar: _navigationBar(context),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            spacing: 16,
            children: [
              // * Balance
              Column(
                children: [
                  BalanceSection().paddingSymmetric(h: 16, v: 12),
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
                        style: context.textTheme.labelLarge,
                      ),
                      Text('See All', style: context.textTheme.bodySmall),
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
      ),
    );
  }

  Widget _navigationBar(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        height: 80,
        color: context.colorScheme.surface,
        alignment: Alignment.center,
        child: Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome01,
                color: SiColors.grayscale3,
              ),
              isSelected: true,
              padding: EdgeInsets.symmetric(horizontal: 24),
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
              onPressed: () {},
            ),
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowUpDown,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedArrowUpDown),
              onPressed: () {},
            ),
            IconButton.filled(
              padding: EdgeInsets.symmetric(horizontal: 24),
              onPressed: () {
                showCupertinoSheet(
                  context: context,
                  builder: (context) => TransactionFormWidget(),
                );
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedTarget02,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedTarget02),
              onPressed: () {},
            ),
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCalculator01,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedCalculator01),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
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
