import 'package:flutter/cupertino.dart';

import '../../../../common/common.dart';
import 'budget_form.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key, required this.budget});

  final Budget budget;

  @override
  Widget build(BuildContext context) {
    double percentage = budget.target == 0 ? 0 : budget.value / budget.target;
    return GestureDetector(
      onTap: () {
        showCupertinoSheet(
          context: context,
          pageBuilder: (dctx) => BudgetForm(budget: budget, dctx: dctx),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 0.96],
            colors: [context.colorScheme.primaryContainer, context.colorScheme.secondary],
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          color: context.colorScheme.onPrimary,
          margin: EdgeInsets.all(2.w),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(budget.type.icon, color: budget.type.color, size: 28.sp),
                Column(
                  spacing: 2.h,
                  children: [
                    Text(budget.type.label, style: kSemiBoldTextStyle.copyWith(fontSize: 16.sp)),
                    if (budget.target > 0)
                      Text(
                        budget.target.currency,
                        style: kMediumTextStyle.copyWith(fontSize: 14.sp),
                      ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Column(
                    spacing: 4.h,
                    children: [
                      COSLinearProgress(value: percentage, color: budget.type.color),
                      Center(
                        child: Text(
                          '${(percentage * 100).round()}% ${budget.value > 0 ? '(${budget.value.compactCurrency})' : ''}',
                          style: kMediumTextStyle.copyWith(
                            fontSize: 12.sp,
                            color: budget.type.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
