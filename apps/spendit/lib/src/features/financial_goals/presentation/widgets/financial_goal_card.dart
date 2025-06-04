import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit_core/spendit_core.dart';

class FinancialGoalCard extends StatelessWidget {
  const FinancialGoalCard({super.key});

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
                        color: SpendItColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedFlag01,
                        color: SpendItColors.neutralColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Aerox Alpha', style: SpendItTextStyles.medium.copyWith(fontSize: 16)),
                        Text(
                          'Rp 5.000.000 / Rp 35.000.000',
                          style: SpendItTextStyles.medium.copyWith(fontSize: 12),
                        ),
                        Gap(8),
                        SizedBox(
                          width: context.deviceWidth * .54,
                          child: LinearProgressIndicator(value: 1 / 7, minHeight: 8),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedMoreHorizontal,
                  color: SpendItColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
