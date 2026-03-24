import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/home/presentation/providers/balance_provider.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeWidget extends ConsumerWidget {
  const IncomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalIncome = ref.watch(totalIncomeProvider).value ?? 0;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,
            children: [
              SfCircularChart(
                palette: IncomeCategory.values.reversed
                    .toList()
                    .map((e) => incomeCategoryColors[e]!)
                    .toList(),
                series: [
                  RadialBarSeries<Income, String>(
                    dataSource: IncomeCategory.values.reversed
                        .toList()
                        .asMap()
                        .entries
                        .map(
                          (e) => Income(
                            amount: 10000 + ((e.key + 1) * 10000),
                            category: e.value,
                            createdAt: DateTime.now(),
                          ),
                        )
                        .toList(),
                    gap: '8%',
                    radius: '90%',
                    innerRadius: '72%',
                    legendIconType: LegendIconType.circle,
                    trackColor: SiColors.card,
                    xValueMapper: (datum, index) => datum.category.title,
                    yValueMapper: (datum, index) => datum.amount,
                    cornerStyle: CornerStyle.bothCurve,
                    maximumValue: 200000,
                  ),
                ],
              ),
              Column(
                spacing: 4,
                children: [
                  Text('Total Income'),
                  Text(
                    totalIncome.currency,
                    style: context.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
