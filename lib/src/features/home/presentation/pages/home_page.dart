import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/common/common.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SafeArea(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .05),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        child: Text(
                          'A',
                          style: TextStyle(color: SiColors.background),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: NavigationBar(
            maintainBottomViewPadding: true,
            destinations: [
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome01,
                  color: SiColors.grayscale3,
                ),
                isSelected: true,
                selectedIcon: HugeIcon(
                  icon: HugeIcons.strokeRoundedHome01,
                  color: SiColors.primary,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeftRight,
                  color: SiColors.grayscale3,
                ),
                onPressed: () {},
              ),
              IconButton.filled(
                onPressed: () {
                  showCupertinoSheet(
                    context: context,
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: Text('Add Transaction')),
                    ),
                  );
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedSavings,
                  color: SiColors.grayscale3,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: HugeIcon(
                  icon: HugeIcons.strokeRoundedTarget02,
                  color: SiColors.grayscale3,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            children: [
              // * Balance
              BalanceSection().paddingSymmetric(h: 16),
              24.space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      color: SiColors.textSecondary,
                    ),
                  ),
                ],
              ).paddingSymmetric(h: 16),
              16.space,
              Column(
                spacing: 8,
                children: [
                  TransactionCard(),
                  TransactionCard(),
                  TransactionCard(),
                ],
              ).paddingSymmetric(h: 16),
              24.space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Goals',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      color: SiColors.textSecondary,
                    ),
                  ),
                ],
              ).paddingSymmetric(h: 16),
              16.space,
              SizedBox(
                height: 88,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 8,
                    children: [GoalCard(), GoalCard()],
                  ).paddingSymmetric(h: 16),
                ),
              ).paddingOnly(bottom: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: 64,
                  width: 64,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: SiColors.primaryContainer,
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedTarget02,
                    color: SiColors.primary,
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '12 September 2025',
                        style: TextStyle(color: SiColors.textSecondary),
                      ),
                      Text(
                        'Goals',
                        style: TextStyle(
                          color: SiColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Vespa Matic',
                        style: TextStyle(
                          fontSize: 12,
                          color: SiColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text('- Rp. 300.000'),
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
          width: context.screenSize.width * .7,
          padding: const EdgeInsets.all(12.0),
          child: IntrinsicHeight(
            child: Row(
              spacing: 12,
              children: [
                Container(
                  height: 64,
                  width: 64,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
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
                    spacing: 8,
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
                      LinearProgressIndicator(value: .5),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '16.000.000',
                              style: TextStyle(color: SiColors.textSecondary),
                            ),
                            TextSpan(text: ' / '),
                            TextSpan(
                              text: '32.000.000',
                              style: TextStyle(fontWeight: FontWeight.w600),
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
      _ => SiColors.background,
    };

    final foreground = switch (type) {
      TransactionType.income => SiColors.primary,
      TransactionType.expense => SiColors.secondary,
      _ => SiColors.primary,
    };

    final icon = switch (type) {
      TransactionType.income => HugeIcon(
        icon: HugeIcons.strokeRoundedAdd01,
        color: foreground,
      ),
      TransactionType.expense => HugeIcon(
        icon: HugeIcons.strokeRoundedMinusSign,
        color: foreground,
      ),
      _ => HugeIcon(
        icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
        color: foreground,
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
        color: background,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp 500 rb',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: foreground,
                ),
              ),
              icon,
            ],
          ),
          Text(
            name,
            style: TextStyle(fontSize: 12, color: SiColors.textSecondary),
          ),
          4.space,
        ],
      ),
    );
  }
}

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkResponse(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 4,
            children: [
              Align(
                alignment: AlignmentGeometry.topRight,
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowUpRight03,
                  color: SiColors.textSecondary,
                ),
              ),
              Text(
                'Rp 1.000.000',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: SiColors.primary,
                ),
              ),
              Text('Balance', style: TextStyle(color: SiColors.textSecondary)),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: TransactionTypeCard(TransactionType.income),
                    ),
                    Expanded(
                      child: TransactionTypeCard(TransactionType.expense),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
