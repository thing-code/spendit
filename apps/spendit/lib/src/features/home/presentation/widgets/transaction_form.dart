import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    var type = ValueNotifier({TransactionType.expense});
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Scaffold(
        backgroundColor: SpendItColors.neutralColor,
        body: ListView(
          padding: EdgeInsets.only(bottom: 16),
          children: [
            ValueListenableBuilder(
              valueListenable: type,
              builder: (context, value, child) => SegmentedButton<TransactionType>(
                segments: [
                  ButtonSegment(
                    value: TransactionType.income,
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedSquareArrowDownLeft,
                      color: Colors.black,
                    ),
                  ),
                  ButtonSegment(
                    value: TransactionType.expense,
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedSquareArrowUpRight,
                      color: Colors.black,
                    ),
                  ),
                ],
                selected: type.value,
                onSelectionChanged: (v) => type.value = v,
              ),
            ),
          ],
        ),
        bottomNavigationBar: SpendItButton.primary(text: 'Simpan', onPressed: () {}),
      ),
    );
  }
}
