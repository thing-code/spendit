import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../common/common.dart';
import '../widgets/balance.dart';
import '../widgets/expense_summary.dart';
import '../widgets/monthly_budget.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        title: Text('Hi, ${GreetingUtil.greeting} 🖐️', style: kMediumTextStyle),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: Gap(8)),
          SliverToBoxAdapter(child: MyBalance()),
          SliverToBoxAdapter(child: Gap(24)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Monthly Target', style: kSemiBoldTextStyle.copyWith(fontSize: 18)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(16), sliver: MonthlyBudget()),
          SliverToBoxAdapter(child: ExpenseSummary()),
        ],
      ),
    );
  }
}
