import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/core/core.dart';

/// Main Transaction Form
class TransactionFormWidget extends StatelessWidget {
  const TransactionFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TransactionType.values.length,
      child: Scaffold(
        appBar: SiAppBar(title: Text('New Transaction')),
        body: Column(
          spacing: 16,
          children: [
            TabBar(
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
                children: List.generate(TransactionType.values.length, (index) {
                  return Center(child: Text('Tab'));
                }),
              ),
            ),
          ],
        ).paddingAll(16),
        bottomNavigationBar: SiButton.primary(
          onPressed: () {
            SiLogger.data('Save');
          },
          text: 'Save',
        ).paddingSymmetric(v: context.viewPadding.bottom + 8, h: 16),
      ),
    );
  }
}

/// * Transaction Income Form

/// * Transaction Expense Form

/// * Transaction Goals Form
