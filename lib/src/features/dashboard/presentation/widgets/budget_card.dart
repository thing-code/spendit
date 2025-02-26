import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common.dart';
import 'budget_form.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({super.key, required this.budget});

  final Budget budget;

  @override
  Widget build(BuildContext context) {
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
          color: Colors.white,
          margin: EdgeInsets.all(2.w),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(budget.type.icon, color: budget.type.color, size: 28.sp),
                Column(
                  children: [
                    Text(budget.type.label, style: kSemiBoldTextStyle.copyWith(fontSize: 16.sp)),
                    Text(
                      budget.target == 0 ? 'Rp. -' : budget.target.currency,
                      style: kMediumTextStyle.copyWith(fontSize: 14.sp),
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: budget.target == 0 ? 0 : budget.value / budget.target,
                  borderRadius: BorderRadius.circular(100),
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(budget.type.color),
                  stopIndicatorColor: budget.type.color,
                  stopIndicatorRadius: 4.r,
                  minHeight: 6.h,
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
