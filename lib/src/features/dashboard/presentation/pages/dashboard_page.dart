import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../common/common.dart';
import '../providers/budget.dart';
import '../widgets/balance.dart';
import '../widgets/monthly_budget.dart';
import '../widgets/transaction_summary.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    Future.microtask(() async {
      await _reset();
      final budgets = await ref.read(budgetStateProvider.future);
      if (budgets.isEmpty) await ref.read(budgetStateProvider.notifier).init();
    });
    super.initState();
  }

  Future<void> _reset() async {
    final resetUtil = COSResetUtil(ref);
    await resetUtil.monthlyReset(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48.h,
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        title: Text('Hi, ${COSGreetingUtil.greeting} 🖐️', style: kMediumTextStyle),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: COSBalance()),
          SliverToBoxAdapter(child: COSTransactionSummary()),
          SliverToBoxAdapter(child: Gap(12.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('Monthly Target', style: kSemiBoldTextStyle.copyWith(fontSize: 18.sp)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(16.w), sliver: COSMonthlyBudget()),
        ],
      ),
    );
  }
}
