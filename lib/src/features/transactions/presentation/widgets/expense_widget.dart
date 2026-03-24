import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:spendit/src/features/transactions/presentation/providers/transactions_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseWidget extends ConsumerWidget {
  const ExpenseWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expense = ref.watch(expenseProvider);
    return Padding(
      padding: EdgeInsets.all(16),
      child: switch (expense) {
        AsyncData(:var value) => _ExpenseDataWidget(data: value),
        AsyncError(:var error) => Center(child: Text(error.toString())),
        _ => Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class _ExpenseDataWidget extends StatelessWidget {
  const _ExpenseDataWidget({required this.data});

  final List<Transactions> data;

  @override
  Widget build(BuildContext context) {
    final expenses = data.whereType<Expense>().toList();
    return Column(
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
              dataSource: expenses
                  .asMap()
                  .entries
                  .map(
                    (e) => Expense(
                      amount: e.value.amount,
                      category: e.value.category,
                      createdAt: DateTime.now(),
                    ),
                  )
                  .toList(),
              gap: '4%',
              radius: '100%',
              innerRadius: '10%',
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
    );
  }
}
