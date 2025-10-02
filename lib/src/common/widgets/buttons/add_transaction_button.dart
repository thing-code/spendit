import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../features/dashboard/presentation/providers/budget.dart';
import '../../../features/dashboard/presentation/providers/summary.dart';
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
              createTransaction(context);
              return;
              showOptions(context).then((type) async {
                if (type == null) return;
                if (context.mounted) {
                  final res = await showCupertinoSheet<(Income?, Expense?, DateTime?)>(
                    context: context,
                    pageBuilder: (dctx) => TransactionForm(type: type),
                  );
                  if (res == null) return;
                  if (res.$1 != null && res.$3 != null && context.mounted) {
                    await _income(context, ref, res, type);
                  }
                  if (res.$2 != null && res.$3 != null && context.mounted) {
                    await _expense(context, ref, res, type);
                  }
                }
              });
            },
            elevation: 0,
            backgroundColor: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onPrimary,
            shape: CircleBorder(),
            child: Icon(Icons.add, size: 28.sp),
          ),
        ],
      ),
    );
  }

  Future<void> createTransaction(BuildContext context) async {
    await showCupertinoSheet(
      context: context,
      pageBuilder:
          (context) => Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 48.sp),
                      Text('Create Transaction', style: kMediumTextStyle.copyWith(fontSize: 16)),
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(Icons.close, size: 24.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Future<void> _expense(
    BuildContext context,
    WidgetRef ref,
    (Income?, Expense?, DateTime?) res,
    TransactionType type,
  ) async {
    COSLoading.show(context);
    await ref.read(expenseStateProvider(date: res.$3).notifier).add(res.$2!);
    if (res.$3?.month == now.month) {
      await ref.read(budgetStateProvider.notifier).updateUsage(res.$2!.type, res.$2!.value);
    }
    ref.invalidate(expenseStateProvider);
    await ref.read(transactionSummaryStateProvider.notifier).update(res.$3!, type);
    COSLoading.hide();
  }

  Future<void> _income(
    BuildContext context,
    WidgetRef ref,
    (Income?, Expense?, DateTime?) res,
    TransactionType type,
  ) async {
    COSLoading.show(context);
    await ref.read(incomeStateProvider(date: res.$3).notifier).add(res.$1!);
    ref.invalidate(incomeStateProvider);
    await ref.read(transactionSummaryStateProvider.notifier).update(res.$3!, type);
    COSLoading.hide();
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
            _button(TransactionType.income, context),
            _button(TransactionType.expense, context),
          ],
        ),
      ),
    );
  }

  Expanded _button(TransactionType type, BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.pop(type),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: type.cDark,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: type.cLight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 4.h,
            children: [
              Icon(type.icon, color: type.cLight),
              Text(type.label, style: kMediumTextStyle.copyWith(color: type.cLight)),
            ],
          ),
        ),
      ),
    );
  }
}
