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
          return Center(child: Text('Tidak ada data'));
        }
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final income = data[index];
            return COSIncomeListTile(income: income);
          },
          padding: EdgeInsets.all(16.w),
          separatorBuilder: (context, index) => 12.verticalSpace,
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
      shadowColor: context.colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(12.r),
      child: COSListTile.transaction(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('+ ${income.value.currency}', style: kSemiBoldTextStyle.copyWith(fontSize: 16.sp)),
            Text(
              income.date.getDate,
              style: kRegularTextStyle.copyWith(fontSize: 14.sp, color: Colors.grey.shade500),
            ),
          ],
        ),
        subtitle: Text(
          income.type.label,
          style: kRegularTextStyle.copyWith(fontSize: 14.sp, color: Colors.grey.shade500),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        icon: income.type.icon,
        iconColor: income.type.color,
      ),
    );
  }
}
