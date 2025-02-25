import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendit/src/common/common.dart';

class ExpenseSummary extends ConsumerWidget {
  const ExpenseSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.primaryContainer.withValues(alpha: .7),
          ],
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Text('Expense Summary', style: kSemiBoldTextStyle.copyWith(fontSize: 18.sp)),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              color: Colors.white.withAlpha(100),
              padding: EdgeInsets.all(16.w),
              child: ExpenseSummaryData(expenses: dummyExpenses),
            ),
          ),
        ],
      ),
    );
  }
}

class ExpenseSummaryData extends StatelessWidget {
  const ExpenseSummaryData({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 3,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: false,
            topTitles: AxisTitles(sideTitles: SideTitles()),
            rightTitles: AxisTitles(sideTitles: SideTitles()),
            bottomTitles: AxisTitles(sideTitles: SideTitles()),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 70.w,
                interval: 12000,
                getTitlesWidget: (value, meta) {
                  return Text(value.toInt().compactCurrency);
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              color: context.colorScheme.primaryContainer,
              spots:
                  expenses
                      .asMap()
                      .entries
                      .map((e) => FlSpot(e.key.toDouble(), (e.value.value)))
                      .toList(),
              isCurved: true,
              barWidth: 2,
              preventCurveOverShooting: true,
              isStrokeCapRound: true,
              dotData: FlDotData(
                getDotPainter: (spot, _, _, _) {
                  return FlDotCirclePainter(
                    color: Colors.blueAccent,
                    strokeWidth: 0,
                    strokeColor: context.colorScheme.primaryContainer,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primaryContainer.withValues(alpha: .33),
                    context.colorScheme.primaryContainer.withValues(alpha: .66),
                    (context.colorScheme.primaryContainer),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
