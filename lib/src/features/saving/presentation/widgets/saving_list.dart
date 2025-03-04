import '../../../../common/common.dart';
import '../providers/saving.dart';
import 'saving_item.dart';

class SavingList extends ConsumerWidget {
  const SavingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savings = ref.watch(savingStateProvider);
    return COSAsyncWidget(
      asyncValue: savings,
      onData: (data) => _SavingListData(data: data),
      onLoading: () => _SavingListLoading(),
    );
  }
}

class _SavingListData extends StatelessWidget {
  const _SavingListData({required this.data});

  final List<Saving> data;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Container()
        : ListView.separated(
          itemBuilder: (context, i) {
            final saving = data[i];
            bool isSameMonth = true;

            if (i == 0) {
              isSameMonth = false;
            } else {
              final prev = data[i - 1].date;
              isSameMonth = saving.date.isSameMonth(prev);
            }

            if (i == 0 || !isSameMonth) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (i > 0) 8.verticalSpace,
                  Text(saving.date.getMonthAndYear, style: kRegularTextStyle),
                  8.verticalSpace,
                  SavingItem(saving: saving),
                ],
              );
            }

            return SavingItem(saving: saving);
          },
          separatorBuilder: (_, _) => 8.verticalSpace,
          itemCount: data.length,
          padding: EdgeInsets.all(16.w),
          physics: BouncingScrollPhysics(),
        );
  }
}

class _SavingListLoading extends StatelessWidget {
  const _SavingListLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final saving = Saving(value: 1000000, date: now);
        return SavingItem(saving: saving).skeleton();
      },
      separatorBuilder: (_, _) => 8.verticalSpace,
      itemCount: 5,
      padding: EdgeInsets.all(16.w),
      physics: BouncingScrollPhysics(),
    );
  }
}
