import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    var type = ValueNotifier({TransactionType.expense});
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Scaffold(
        backgroundColor: SIColors.neutralColor,
        body: ListView(
          padding: EdgeInsets.only(bottom: 16),
          children: [
            ValueListenableBuilder(
              valueListenable: type,
              builder: (context, value, child) => SegmentedButton<TransactionType>(
                segments: [
                  ButtonSegment(
                    value: TransactionType.income,
                    icon: Icon(IconsaxPlusLinear.import_1),
                  ),
                  ButtonSegment(
                    value: TransactionType.expense,
                    icon: Icon(IconsaxPlusLinear.export_2),
                  ),
                ],
                selected: type.value,
                onSelectionChanged: (v) => type.value = v,
              ),
            ),
          ],
        ),
        bottomNavigationBar: SIButton.primary(text: 'Simpan', onPressed: () {}),
      ),
    );
  }
}
