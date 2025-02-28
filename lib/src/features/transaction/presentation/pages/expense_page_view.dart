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
          return Center(child: Text('Tidak ada data'));
        }
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          itemBuilder: (context, index) {
            final expense = data[index];
            return COSExpenseListTile(expense: expense);
          },
          separatorBuilder: (context, index) => 12.verticalSpace,
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
      shadowColor: context.colorScheme.primaryContainer,
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
              expense.date.getDate,
              style: kRegularTextStyle.copyWith(fontSize: 14.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
        subtitle: Text(
          expense.type.label,
          style: kRegularTextStyle.copyWith(fontSize: 14.sp, color: Colors.grey.shade500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        icon: expense.type.icon,
        iconColor: expense.type.color,
      ),
    );
  }
}
