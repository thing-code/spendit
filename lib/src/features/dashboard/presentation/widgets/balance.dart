import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendit/src/common/common.dart';

class COSBalance extends StatelessWidget {
  const COSBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primaryContainer,
            context.colorScheme.primaryContainer.withValues(alpha: .8),
            context.colorScheme.primaryContainer.withValues(alpha: .4),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.h,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Balance',
                style: kRegularTextStyle.copyWith(
                  fontSize: 18.sp,
                  color: context.colorScheme.primary.withValues(alpha: .6),
                ),
              ),
              Text(1500000.currency, style: kBoldTextStyle.copyWith(fontSize: 28.sp)),
            ],
          ),
          Container(
            constraints: BoxConstraints(maxWidth: context.deviceSize.width),
            child: Row(
              spacing: 12.w,
              children: [
                Expanded(child: TransactionFlowCard(type: TransactionType.income, value: 1000000)),
                Expanded(child: TransactionFlowCard(type: TransactionType.expense, value: 1000000)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
              '$symbol ${value.currency}',
              style: kBoldTextStyle.copyWith(fontSize: 14.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
