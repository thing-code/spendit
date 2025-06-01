import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit_core/spendit_core.dart';

class BudgetStatisticCard extends StatelessWidget {
  const BudgetStatisticCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4.2,
      child:
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CircularProgressIndicator(
                      value: .7,
                      strokeWidth: 8,
                      constraints: BoxConstraints(minHeight: 80, minWidth: 80),
                    ),
                  ),
                  Column(
                    spacing: 2,
                    children: [
                      Text('Terpakai'),
                      Badge(
                        label: Text(
                          '${700000.toDouble().toRupiahCompact} dari ${1200000.toDouble().toRupiahCompact}',
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        backgroundColor: SpendItColors.accentColor.shade400,
                        textColor: SpendItColors.primaryColor,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Anggaran Bulanan'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            1200000.toDouble().toRupiahCompact,
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
          ).onTap(
            onTap: () {
              Toast.show(context, title: 'THIS IS A TEST TOAST');
            },
          ),
    );
  }
}
