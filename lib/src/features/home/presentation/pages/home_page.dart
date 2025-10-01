import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/core/common.dart';

import '../widgets/widgets.dart';

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
