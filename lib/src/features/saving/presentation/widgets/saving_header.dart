import 'package:flutter/cupertino.dart';

import '../../../../common/common.dart';
import '../providers/saving.dart';
import 'saving_form.dart';

class SavingHeader extends ConsumerWidget {
  const SavingHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savings = ref.watch(savingStateProvider);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      shadowColor: Colors.transparent,
      color: context.colorScheme.primaryContainer.withValues(alpha: .2),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Saving', style: kRegularTextStyle.copyWith(fontSize: 16.sp)),
                if (savings.hasValue)
                  Text(
                    ref.read(savingStateProvider.notifier).total().currency,
                    style: kBoldTextStyle.copyWith(fontSize: 20.sp),
                  ),
                if (savings.isLoading)
                  Text(
                    20000000.currency,
                    style: kBoldTextStyle.copyWith(fontSize: 20.sp),
                  ).skeleton(),
              ],
            ),
            IconButton.filled(
              onPressed: () async {
                await showCupertinoSheet(context: context, pageBuilder: (c) => SavingForm());
              },
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
