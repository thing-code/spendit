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
          itemBuilder: (context, index) {
            return ListTile();
          },
          separatorBuilder: (context, index) => 12.verticalSpace,
          itemCount: data.length,
        );
      },
    );
  }
}
