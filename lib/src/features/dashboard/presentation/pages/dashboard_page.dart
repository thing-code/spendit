import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../common/common.dart';
import '../providers/budget.dart';
import '../widgets/balance.dart';
import '../widgets/expense_summary.dart';
import '../widgets/monthly_budget.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    Future.microtask(() async {
      final budgets = await ref.read(budgetStateProvider.future);
      if (budgets.isEmpty) {
        await ref.read(budgetStateProvider.notifier).init();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
