import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../common/common.dart';
import '../providers/budget.dart';
import '../widgets/balance.dart';
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
      final budgets = await ref.read(budgetStateProvider.future);
      if (budgets.isEmpty) await ref.read(budgetStateProvider.notifier).init();
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
          SliverToBoxAdapter(child: COSBalance()),
          SliverToBoxAdapter(child: Gap(8.h)),
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

class COSTransactionSummary extends StatelessWidget {
  const COSTransactionSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final summaries = [
      TransactionSummary(month: 1, income: 4850000, expense: 3000000),
      TransactionSummary(month: 2, income: 4850000, expense: 3000000),
      TransactionSummary(month: 3, income: 4850000, expense: 3000000),
      TransactionSummary(month: 4, income: 4850000, expense: 3000000),
      TransactionSummary(month: 5, income: 4850000, expense: 3000000),
      TransactionSummary(month: 6, income: 4850000, expense: 3000000),
      TransactionSummary(month: 7, income: 4850000, expense: 3000000),
      TransactionSummary(month: 8, income: 4850000, expense: 3000000),
      TransactionSummary(month: 9, income: 4850000, expense: 3000000),
      TransactionSummary(month: 10, income: 4850000, expense: 2500000),
      TransactionSummary(month: 11, income: 4850000, expense: 2500000),
      TransactionSummary(month: 12, income: 4650000, expense: 2500000),
    ];

    return Card(
      color: context.colorScheme.primary,
      surfaceTintColor: context.colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${DateTime.now().year}',
                  style: kSemiBoldTextStyle.copyWith(
                    fontSize: 18.sp,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                  child: VerticalDivider(color: context.colorScheme.primaryContainer),
                ),
                Text(
                  'Transaction Summary',
                  style: kSemiBoldTextStyle.copyWith(
                    fontSize: 18.sp,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Wrap(
              spacing: 8,
              children: [
                LegendWidget(color: context.colorScheme.primaryContainer, title: 'Income'),
                LegendWidget(color: context.colorScheme.errorContainer, title: 'Expense'),
              ],
            ),
            16.verticalSpace,
            AspectRatio(
              aspectRatio: 2,
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
                        getTitlesWidget: (value, meta) => bottomTitles(context, value, meta),
                        reservedSize: 20,
                      ),
                    ),
                  ),
                  barTouchData: BarTouchData(enabled: false),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  groupsSpace: 12,
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: 0,
                        color: context.colorScheme.onPrimary.withValues(alpha: .4),
                        // dashArray: [12, 4],
                        strokeWidth: 2,
                      ),
                    ],
                  ),
                  barGroups: [
                    ...summaries.map(
                      (e) => BarChartGroupData(
                        x: e.month,
                        groupVertically: true,
                        barRods: [
                          BarChartRodData(
                            toY: e.income.toDouble(),
                            color: context.colorScheme.primaryContainer,
                            width: 10,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                          ),
                          BarChartRodData(
                            toY: -e.expense.toDouble(),
                            color: context.colorScheme.errorContainer,
                            width: 10,
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SideTitleWidget bottomTitles(BuildContext context, double value, TitleMeta meta) {
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
      child: Text(
        text,
        style: kLightTextStyle.copyWith(
          fontSize: 12,
          color: context.colorScheme.onPrimary.withValues(alpha: .4),
        ),
      ),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6.w,
      children: [
        Container(
          width: 16,
          height: 8,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: color),
        ),
        Text(
          title,
          style: kRegularTextStyle.copyWith(color: context.colorScheme.onPrimary, fontSize: 12),
        ),
      ],
    );
  }
}
