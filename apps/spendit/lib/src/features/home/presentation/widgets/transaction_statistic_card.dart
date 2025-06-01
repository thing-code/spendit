import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionStatisticCard extends StatelessWidget {
  const TransactionStatisticCard(this.transactionType, {super.key});

  final TransactionType transactionType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Icon(icon, color: transactionType.fg),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transactionType.label),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        1000000.toDouble().toRupiahCompact,
                        style: SpendItTextStyles.bold.copyWith(fontSize: 24),
                      ),
                      Icon(SolarIconsOutline.altArrowRight),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData get icon {
    switch (transactionType) {
      case TransactionType.income:
        return SolarIconsOutline.squareArrowLeftDown;
      case TransactionType.expense:
        return SolarIconsOutline.squareArrowRightUp;
    }
  }
}