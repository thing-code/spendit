import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import 'budget_form.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key, required this.type, required this.value});

  final BudgetType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoSheet(context: context, pageBuilder: (context) => BudgetForm(type: type));
      },
      child: Container(
        // margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 0.96],
            colors: [context.colorScheme.primaryContainer, context.colorScheme.secondary],
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          margin: EdgeInsets.all(2),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(type.icon, color: type.color, size: 28),
                Column(
                  children: [
                    Text(type.label, style: kSemiBoldTextStyle.copyWith(fontSize: 16)),
                    Text(
                      value == 0 ? 'Rp. -' : value.currency,
                      style: kMediumTextStyle.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: value / 10000000,
                  borderRadius: BorderRadius.circular(100),
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(type.color),
                  stopIndicatorColor: type.color,
                  // ignore: deprecated_member_use
                  year2023: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
