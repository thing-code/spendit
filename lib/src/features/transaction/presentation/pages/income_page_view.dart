import '../../../../common/common.dart';
import '../providers/income.dart';

class IncomePageView extends ConsumerWidget {
  const IncomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomes = ref.watch(incomeStateProvider());
    return COSAsyncWidget(
      asyncValue: incomes,
      onData: (data) {
        if (data.isEmpty) {
          return Center(child: Text('No income data'));
        }
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, i) {
            final income = data[i];
            bool isSameDate = true;

            if (i == 0) {
              isSameDate = false;
            } else {
              final prev = data[i - 1].date;
              isSameDate = income.date.isSameDate(prev);
            }

            if (i == 0 || !isSameDate) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i > 0) 8.verticalSpace,
                  Text(
                    income.date.getDate,
                    style: kSemiBoldTextStyle.copyWith(
                      color: context.colorScheme.primary.withAlpha(100),
                    ),
                  ),
                  8.verticalSpace,
                  COSIncomeListTile(income: income),
                ],
              );
            }

            return COSIncomeListTile(income: income);
          },
          padding: EdgeInsets.all(16.w),
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemCount: data.length,
        );
      },
    );
  }
}

class COSIncomeListTile extends StatelessWidget {
  const COSIncomeListTile({super.key, required this.income});

  final Income income;

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
            Text('+ ${income.value.currency}', style: kSemiBoldTextStyle.copyWith(fontSize: 16.sp)),
            Text(
              income.date.getCompact,
              style: kRegularTextStyle.copyWith(
                fontSize: 14.sp,
                color: context.colorScheme.primary.withAlpha(100),
              ),
            ),
          ],
        ),
        subtitle: Text(
          income.type.label,
          style: kRegularTextStyle.copyWith(
            fontSize: 14.sp,
            color: context.colorScheme.primary.withAlpha(100),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        icon: income.type.icon,
        iconColor: income.type.color,
      ),
    );
  }
}
