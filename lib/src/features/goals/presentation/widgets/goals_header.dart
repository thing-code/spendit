import 'package:flutter/cupertino.dart';
import 'package:spendit/src/features/goals/presentation/providers/goals.dart';

import '../../../../common/common.dart';
import 'goals_form.dart';

class GoalsHeader extends ConsumerWidget {
  const GoalsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.colorScheme.primaryContainer,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Financial Goals', style: kMediumTextStyle.copyWith(fontSize: 16.sp)),
          FilledButton(
            onPressed: () async {
              final res = await showCupertinoSheet<Goals>(
                context: context,
                pageBuilder: (_) => GoalsForm(),
              );
              if (res == null) return;
              final created = await ref.read(goalsStateProvider.notifier).add(res);
              if (created && context.mounted) {
                COSSnackBar.success(context, message: 'New goals has been created.');
              }
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
