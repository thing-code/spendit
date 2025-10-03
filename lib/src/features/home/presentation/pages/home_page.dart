import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/core.dart';
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
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
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
                      appBar: AppBar(title: Text('New Transaction')),
                      bottomNavigationBar:
                          SiButton.primary(
                            onPressed: () {
                              SiLogger.print('Save');
                            },
                            text: 'Save',
                          ).paddingSymmetric(
                            v: context.viewPadding.bottom + 8,
                            h: 16,
                          ),
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
                    SizedBox(
                      height: 72,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 8,
                          children: [
                            TransactionTypeCard(TransactionType.income),
                            TransactionTypeCard(TransactionType.expense),
                          ],
                        ).paddingSymmetric(h: 16),
                      ),
                    ),
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
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 12,
                            color: SiColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 8,
                      children: List.generate(3, (index) => TransactionCard()),
                    ),
                  ],
                ).paddingSymmetric(h: 16),
                Column(
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Goals',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
                    SizedBox(
                      height: 72,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 8,
                          children: [GoalCard(), GoalCard()],
                        ).paddingSymmetric(h: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                color: SiColors.primary,
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
