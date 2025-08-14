import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionForm extends ConsumerWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var type = ValueNotifier({TransactionType.expense});
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 16, right: 16, left: 16),
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.only(bottom: 16),
          children: [
            ValueListenableBuilder(
              valueListenable: type,
              builder: (context, value, child) {
                return Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child:
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: value.contains(TransactionType.income)
                                  ? SiColors.accent.withAlpha(50)
                                  : Colors.white,
                            ),
                            child: Column(
                              children: [
                                Icon(IconsaxPlusBold.export),
                                Text('Pengaluaran'),
                              ],
                            ),
                          ).onTap(
                            onTap: () => type.value = {TransactionType.income},
                          ),
                    ),
                    Expanded(
                      child:
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: value.contains(TransactionType.expense)
                                  ? SiColors.accent.withAlpha(50)
                                  : Colors.white,
                            ),
                            child: Column(
                              children: [
                                Icon(IconsaxPlusBold.export),
                                Text('Pengaluaran'),
                              ],
                            ),
                          ).onTap(
                            onTap: () => type.value = {TransactionType.expense},
                          ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: SiButton.secondary(
          text: 'Simpan',
          onPressed: () {},
        ),
      ),
    );
  }
}
