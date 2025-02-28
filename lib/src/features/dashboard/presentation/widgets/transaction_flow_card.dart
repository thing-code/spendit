import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common.dart';

class TransactionFlowCard extends StatelessWidget {
  const TransactionFlowCard({super.key, required this.value, required this.type});

  final TransactionType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    final title = switch (type) {
      TransactionType.expense => 'Expense',
      TransactionType.income => 'Income',
    };

    final symbol = switch (type) {
      TransactionType.expense => '-',
      TransactionType.income => '+',
    };

    String v = value == 0 ? '-' : '$symbol ${value.compactCurrency}';

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(50),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 8.h,
          children: [
            Text(
              title,
              style: kMediumTextStyle.copyWith(
                color: context.colorScheme.primary.withValues(alpha: .6),
              ),
            ),
            Text(
              v,
              style: kBoldTextStyle.copyWith(fontSize: 14.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
