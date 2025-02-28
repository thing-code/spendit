import '../../../../common/common.dart';

class GoalsPage extends ConsumerWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: COSAppBar(title: 'Goals', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoalsHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  shadowColor: context.colorScheme.primary,
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      spacing: 12.h,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Goals Title',
                              style: kSemiBoldTextStyle.copyWith(fontSize: 20.sp),
                            ),
                            Text(
                              'Due to ${now.getCompact}',
                              style: kRegularTextStyle.copyWith(
                                color: context.colorScheme.primary.withAlpha(200),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 4.h,
                          children: [
                            COSLinearProgress(
                              value: .5,
                              height: 16,
                              color: context.colorScheme.primary,
                              gap: 0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(150000.compactCurrency),
                                Text(300000.compactCurrency),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          spacing: 12.w,
                          children: [
                            Expanded(
                              child: FilledButton.tonalIcon(
                                style: FilledButton.styleFrom(
                                  backgroundColor: context.colorScheme.primaryContainer,
                                  foregroundColor: context.colorScheme.primary,
                                ),
                                onPressed: () {},
                                label: Text('Add Funds'),
                                icon: Icon(
                                  SolarIconsOutline.addCircle,
                                  color: context.colorScheme.primary,
                                ),
                              ),
                            ),
                            Expanded(
                              child: FilledButton.icon(
                                onPressed: () {},
                                label: Text('Edit Goal'),
                                icon: Icon(SolarIconsOutline.documentAdd),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GoalsHeader extends StatelessWidget {
  const GoalsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primaryContainer,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Financial Goals', style: kMediumTextStyle.copyWith(fontSize: 16.sp)),
          FilledButton(onPressed: () {}, child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
