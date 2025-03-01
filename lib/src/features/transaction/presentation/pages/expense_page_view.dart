import '../../../../common/common.dart';
import '../providers/expense.dart';

class ExpensePageView extends ConsumerWidget {
  const ExpensePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseStateProvider(date: now));
    return COSAsyncWidget(
      asyncValue: expenses,
      onData: (data) {
        if (data.isEmpty) {
          return Center(child: Text('No expense data'));
        }
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          itemBuilder: (_, i) {
            final expense = data[i];
            bool isSameDate = true;

            if (i == 0) {
              isSameDate = false;
            } else {
              final prev = data[i - 1].date;
              isSameDate = expense.date.isSameDate(prev);
            }

            if (i == 0 || !isSameDate) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i > 0) 8.verticalSpace,
                  Text(
                    expense.date.getDate,
                    style: kSemiBoldTextStyle.copyWith(
                      color: context.colorScheme.primary.withAlpha(100),
                    ),
                  ),
                  8.verticalSpace,
                  COSExpenseListTile(expense: expense),
                ],
              );
            }

            return COSExpenseListTile(expense: expense);
          },
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemCount: data.length,
        );
      },
    );
  }
}

class COSExpenseListTile extends StatelessWidget {
  const COSExpenseListTile({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: context.colorScheme.primary,
      borderRadius: BorderRadius.circular(12.r),
      child: COSListTile.transaction(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '- ${expense.value.currency}',
              style: kSemiBoldTextStyle.copyWith(fontSize: 16.sp),
            ),
            Text(
              expense.date.getCompact,
              style: kRegularTextStyle.copyWith(
                fontSize: 14.sp,
                color: context.colorScheme.primary.withAlpha(100),
              ),
            ),
          ],
        ),
        subtitle: Text(
          expense.type.label,
          style: kRegularTextStyle.copyWith(
            fontSize: 14.sp,
            color: context.colorScheme.primary.withAlpha(100),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        icon: expense.type.icon,
        iconColor: expense.type.color,
      ),
    );
  }
}
