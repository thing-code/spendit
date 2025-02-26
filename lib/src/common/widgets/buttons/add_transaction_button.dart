import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/common/common.dart';

import '../../../features/dashboard/presentation/providers/budget.dart';

class COSAddTransactionButton extends ConsumerWidget {
  const COSAddTransactionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final res = await ref.read(budgetStateProvider.future);
              debugPrint(res.toString());
            },
            elevation: 0,
            backgroundColor: context.colorScheme.primary,
            foregroundColor: Colors.white,
            shape: CircleBorder(),
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<TransactionType?> showOptions(BuildContext context) {
    return showGeneralDialog<TransactionType>(
      context: context,
      transitionDuration: Durations.medium2,
      pageBuilder: (context, _, _) => Container(),
      transitionBuilder: (context, animation, _, _) {
        return ScaleTransition(
          scale: Tween<double>(begin: .5, end: 1).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: .5, end: 1).animate(animation),
            child: AddTransactionDialog(),
          ),
        );
      },
    );
  }
}

class AddTransactionDialog extends StatelessWidget {
  const AddTransactionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(maxWidth: 1.sw),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8.h,
          children: [
            _button(
              'Income',
              SolarIconsOutline.archiveDownMinimalistic,
              context.colorScheme.primaryContainer,
              context.colorScheme.primary,
              onTap: () {
                context.pop(TransactionType.income);
              },
            ),
            _button(
              'Expense',
              SolarIconsOutline.archiveUpMinimalistic,
              context.colorScheme.secondaryContainer,
              context.colorScheme.secondary,
              onTap: () {
                context.pop(TransactionType.expense);
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded _button(
    String title,
    IconData icon,
    Color backgroundColor,
    Color foregroundColor, {
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: foregroundColor),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 4.h,
            children: [
              Icon(icon, color: foregroundColor),
              Text(title, style: kMediumTextStyle.copyWith(color: foregroundColor)),
            ],
          ),
        ),
      ),
    );
  }
}
