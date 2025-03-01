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
      margin: EdgeInsets.all(16.w),
      color: Colors.deepPurple.shade50,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Savings',
                  style: kMediumTextStyle.copyWith(fontSize: 16.sp, color: Colors.deepPurple),
                ),
                if (savings.hasValue)
                  Text(
                    ref.read(savingStateProvider.notifier).total().currency,
                    style: kBoldTextStyle.copyWith(fontSize: 24.sp, color: Colors.deepPurple),
                  ),
                if (savings.isLoading)
                  Text(
                    20000000.currency,
                    style: kBoldTextStyle.copyWith(fontSize: 24.sp, color: Colors.deepPurple),
                  ).skeleton(),
              ],
            ),
            FloatingActionButton(
              onPressed: () async {
                await showCupertinoSheet(context: context, pageBuilder: (c) => SavingForm());
              },
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
