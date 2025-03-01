import 'package:spendit/src/common/common.dart';

import '../providers/funds.dart';

class FundsHistory extends ConsumerWidget {
  const FundsHistory(this.goalsId, {super.key});

  final int goalsId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funds = ref.watch(fundsStateProvider(goalsId));
    return COSAsyncWidget(
      asyncValue: funds,
      onData: (data) => _FundHistoryData(data),
      onLoading: () => _FundHistoryLoading(),
    );
  }
}

class _FundHistoryData extends ConsumerWidget {
  const _FundHistoryData(this.data);

  final List<Funds> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return data.isEmpty
        ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('No fund history'), Text('•••••')],
          ),
        )
        : ListView.separated(
          padding: EdgeInsets.all(16.w),
          itemBuilder: (context, index) {
            final fund = data[index];
            return _FundCard(fund);
          },
          separatorBuilder: (context, index) => 8.verticalSpace,
          itemCount: data.length,
        );
  }
}

class _FundHistoryLoading extends StatelessWidget {
  const _FundHistoryLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemBuilder: (context, index) => _FundCard(Funds(value: 100000, date: now, goalsId: 1)),
      separatorBuilder: (context, index) => 8.verticalSpace,
      itemCount: 9,
    ).skeleton();
  }
}

class _FundCard extends ConsumerWidget {
  const _FundCard(this.funds);

  final Funds funds;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      color: context.colorScheme.primary,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '+ ${funds.value.currency}',
              style: kMediumTextStyle.copyWith(
                color: context.colorScheme.onPrimary,
                fontSize: 14.sp,
              ),
            ),
            Text(
              funds.date.getCompactTime,
              style: kRegularTextStyle.copyWith(color: context.colorScheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
