import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common.dart';
import '../providers/summary.dart';

class COSTransactionSummary extends ConsumerWidget {
  const COSTransactionSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaries = ref.watch(transactionSummaryStateProvider);

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
                COSLegendWidget(color: context.colorScheme.primaryContainer, title: 'Income'),
                COSLegendWidget(color: context.colorScheme.secondaryContainer, title: 'Expense'),
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
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      fitInsideHorizontally: true,
                      fitInsideVertically: true,
                      getTooltipColor: (group) => context.colorScheme.onPrimary,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          rod.toY.toInt().currency,
                          kMediumTextStyle.copyWith(fontSize: 12.sp),
                        );
                      },
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: true, drawHorizontalLine: false),
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
                            color: context.colorScheme.secondaryContainer,
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
