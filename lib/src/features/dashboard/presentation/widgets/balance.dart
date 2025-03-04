import 'package:spendit/src/features/dashboard/presentation/providers/balance.dart';

import '../../../../common/common.dart';
import '../../../transaction/presentation/providers/expense.dart';
import '../../../transaction/presentation/providers/income.dart';
import 'transaction_flow_card.dart';

class COSBalance extends ConsumerWidget {
  const COSBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      child: child(ref),
    );
  }

  Widget child(WidgetRef ref) {
    final income = ref.watch(incomeStateProvider(date: now));
    final expense = ref.watch(expenseStateProvider(date: now));
    final balance = ref.watch(balanceStateProvider);
    if (income.isLoading || expense.isLoading || balance.isLoading) {
      return COSBalanceData(balance: 1500000, income: 1000000, expense: 1000000).skeleton();
    }
    if (income.hasError || expense.hasError || balance.hasError) {
      return Center(child: Text('Error Occured'));
    }
    final tIncome = income.hasValue ? income.valueOrNull!.fold(0, (v0, v1) => v0 + v1.value) : 0;
    final tExpense = expense.hasValue ? expense.valueOrNull!.fold(0, (v0, v1) => v0 + v1.value) : 0;
    final tBalance = balance.hasValue ? balance.valueOrNull! : 0;
    return COSBalanceData(balance: tBalance, income: tIncome, expense: tExpense);
  }
}

class COSBalanceData extends StatelessWidget {
  const COSBalanceData({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });

  final int balance;
  final int income;
  final int expense;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.h,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance',
              style: kRegularTextStyle.copyWith(
                fontSize: 16.sp,
                color: context.colorScheme.onSurface.withValues(alpha: .6),
              ),
            ),
            Text(balance.currency, style: kBoldTextStyle.copyWith(fontSize: 28.sp)),
          ],
        ),
        Container(
          constraints: BoxConstraints(maxWidth: context.deviceSize.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              Text(
                'Monthly Transactions',
                style: kRegularTextStyle.copyWith(
                  fontSize: 16.sp,
                  color: context.colorScheme.onSurface.withValues(alpha: .6),
                ),
              ),
              Row(
                spacing: 12.w,
                children: [
                  Expanded(child: TransactionFlowCard(type: TransactionType.income, value: income)),
                  Expanded(
                    child: TransactionFlowCard(type: TransactionType.expense, value: expense),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
