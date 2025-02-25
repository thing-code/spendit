import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      await _reset();
      await ref.read(budgetStateProvider.notifier).init();
    });
    super.initState();
  }

  Future<void> _reset() async {
    final resetUtil = COSResetUtil(ref);
    await resetUtil.monthlyReset();
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
          SliverToBoxAdapter(child: Gap(8.h)),
          SliverToBoxAdapter(child: MyBalance()),
          SliverToBoxAdapter(child: Gap(24.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('Monthly Target', style: kSemiBoldTextStyle.copyWith(fontSize: 18.sp)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(16.w), sliver: MonthlyBudget()),
          SliverToBoxAdapter(child: ExpenseSummary()),
          SliverToBoxAdapter(child: TransactionSummary()),
        ],
      ),
    );
  }
}

class TransactionSummary extends StatelessWidget {
  const TransactionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyExpenses = [
      Expense(type: ExpenseType.food, value: 10000),
      Expense(type: ExpenseType.utility, value: 8000),
      Expense(type: ExpenseType.food, value: 12000),
      Expense(type: ExpenseType.transportation, value: 48000),
      Expense(type: ExpenseType.food, value: 3000),
      Expense(type: ExpenseType.food, value: 15000),
      Expense(type: ExpenseType.food, value: 10000),
    ];

    return Container(
      margin: EdgeInsets.all(16.w),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transaction Summary', style: kSemiBoldTextStyle.copyWith(fontSize: 18.sp)),
              12.verticalSpace,
              AspectRatio(
                aspectRatio: 2,
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(),
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: bottomTitles,
                            reservedSize: 20,
                          ),
                        ),
                      ),
                      barTouchData: BarTouchData(enabled: false),
                      borderData: FlBorderData(show: false),
                      gridData: const FlGridData(show: false),
                      groupsSpace: 12,
                      barGroups:
                          dummyExpenses
                              .asMap()
                              .entries
                              .map(
                                (e) => BarChartGroupData(
                                  x: e.key + 1,
                                  groupVertically: true,
                                  barRods: [
                                    BarChartRodData(
                                      toY: e.value.value,
                                      color: Colors.red,
                                      width: 12,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12.r),
                                      ),
                                    ),
                                    BarChartRodData(
                                      toY: -e.value.value,
                                      color: Colors.teal,
                                      width: 12,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(12.r),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SideTitleWidget bottomTitles(double value, TitleMeta meta) {
    String text = '';
    switch (value.toInt()) {
      case 1:
        text = 'Jan';
        break;
      case 2:
        text = 'Feb';
        break;
      case 3:
        text = 'Mar';
        break;
      case 4:
        text = 'Apr';
        break;
      case 5:
        text = 'May';
        break;
      case 6:
        text = 'Jun';
        break;
      case 7:
        text = 'Jul';
        break;
      case 8:
        text = 'Aug';
        break;
      case 9:
        text = 'Sep';
        break;
      case 10:
        text = 'Oct';
        break;
      case 11:
        text = 'Nov';
        break;
      case 12:
        text = 'Des';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: kLightTextStyle.copyWith(fontSize: 12)),
    );
  }
}
