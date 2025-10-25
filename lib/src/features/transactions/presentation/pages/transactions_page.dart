import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/core.dart';
import '../../domain/models/transactions.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SiAppBar(title: Text('Transactions'), canPop: false),
      body: Column(
        children: [
          SfCircularChart(
            palette: ExpenseCategory.values.reversed
                .toList()
                .map((e) => expenseCategoryColors[e]!)
                .toList(),
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
            ),
            series: [
              RadialBarSeries<Expense, String>(
                dataSource: ExpenseCategory.values.reversed
                    .toList()
                    .asMap()
                    .entries
                    .map(
                      (e) => Expense(
                        amount: 10000 + ((e.key + 1) * 10000),
                        category: e.value,
                        createdAt: DateTime.now(),
                      ),
                    )
                    .toList(),
                gap: '5%',
                radius: '100%',
                innerRadius: '32%',
                legendIconType: LegendIconType.circle,
                trackColor: SiColors.card,
                xValueMapper: (datum, index) => datum.category.title,
                yValueMapper: (datum, index) => datum.amount,
                cornerStyle: CornerStyle.bothCurve,
                maximumValue: 200000,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
