import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/features/dashboard/presentation/providers/budget.dart';

import '../../../features/transaction/presentation/providers/expense.dart';
import '../../../features/transaction/presentation/providers/income.dart';
import '../../../features/transaction/presentation/widgets/transaction_form.dart';
import '../../common.dart';

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
              showOptions(context).then((type) async {
                if (type == null) return;
                if (context.mounted) {
                  final res = await showCupertinoSheet<(Income?, Expense?, DateTime?)>(
                    context: context,
                    pageBuilder: (dctx) => TransactionForm(type: type),
                  );
                  if (res == null) return;
                  if (res.$1 != null) {
                    await ref.onLoading(() async {
                      await ref.read(incomeStateProvider(date: res.$3).notifier).add(res.$1!);
                    });
                  }
                  if (res.$2 != null) {
                    await ref.onLoading(() async {
                      await ref.read(expenseStateProvider(date: res.$3).notifier).add(res.$2!);
                      await ref
                          .read(budgetStateProvider.notifier)
                          .updateUsage(res.$2!.type, res.$2!.value);
                    });
                  }
                }
              });
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
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, _, _) => Container(),
      transitionBuilder: (context, animation, _, _) {
        return AddTransactionDialog()
            .animate()
            .fade(begin: .5, end: 1, curve: Curves.easeInOut)
            .scale(curve: Curves.easeInOut);
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
