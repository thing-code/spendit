import 'package:flutter/material.dart';
import 'package:spendit/src/features/home/presentation/widgets/budget_statistic_card.dart';
import 'package:spendit_core/spendit_core.dart';

class BudgetSection extends StatelessWidget {
  const BudgetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text('Anggaran Bulan Ini', style: SiTextStyles.regular.copyWith(fontSize: 16)),
          BudgetStatisticCard(),
        ],
      ),
    );
  }
}
