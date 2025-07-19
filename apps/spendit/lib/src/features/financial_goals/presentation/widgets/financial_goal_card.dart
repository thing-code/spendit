import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit_core/spendit_core.dart';

class FinancialGoalCard extends StatelessWidget {
  const FinancialGoalCard({super.key, required this.goal});

  final FinancialGoalModel goal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          width: context.deviceWidth,
          child: Stack(
            children: [
              Row(
                spacing: 12,
                children: [
                  IntrinsicHeight(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: SiColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(IconsaxPlusLinear.flag),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(goal.name, style: SiTextStyles.medium.copyWith(fontSize: 16)),
                        Text(
                          '${goal.progressAmount.toDouble().toRupiah} / ${goal.targetAmount.toDouble().toRupiah}',
                          style: SiTextStyles.medium.copyWith(fontSize: 12),
                        ),
                        Gap(8),
                        SizedBox(
                          width: context.deviceWidth * .54,
                          child: LinearProgressIndicator(value: progress, minHeight: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(top: 0, right: 0, child: Icon(IconsaxPlusLinear.more)),
            ],
          ),
        ),
      ),
    );
  }

  double get progress {
    if (goal.progressAmount == 0) {
      return 0;
    }
    return goal.progressAmount / goal.targetAmount;
  }
}
