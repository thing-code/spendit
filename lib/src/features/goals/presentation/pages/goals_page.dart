import 'package:flutter/cupertino.dart';

import '../../../../common/common.dart';
import '../providers/goals.dart';
import '../widgets/funds_form.dart';
import '../widgets/goals_card.dart';
import '../widgets/goals_form.dart';
import '../widgets/goals_header.dart';

class GoalsPage extends ConsumerWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goals = ref.watch(goalsStateProvider);
    return Scaffold(
      appBar: COSAppBar(title: 'Goals', centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoalsHeader(),
          Expanded(
            child: COSAsyncWidget(
              asyncValue: goals,
              onData: (data) => _GoalsOnData(data: data),
              onLoading: () => _GoalsOnLoading(),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalsOnData extends ConsumerWidget {
  const _GoalsOnData({required this.data});

  final List<Goals> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return data.isEmpty
        ? Center(child: Text('No goals data, create new one'))
        : ListView.separated(
          itemBuilder: (_, i) {
            final goals = data[i];
            return GoalsCard(
              goals: goals,
              onEdit: () async {
                final res = await showCupertinoSheet<Goals>(
                  context: context,
                  pageBuilder: (_) => GoalsForm(goals: goals),
                );
                if (res == null) return;
                final updated = await ref.read(goalsStateProvider.notifier).edit(goals);
                if (updated && context.mounted) {
                  COSSnackBar.success(context, message: 'Goals ${goals.name} has been updated.');
                }
              },
              onAddFunds:
                  () => showCupertinoSheet<bool>(
                    context: context,
                    pageBuilder: (context) => FundsForm(goals),
                  ),
            );
          },
          padding: EdgeInsets.all(16.w),
          itemCount: data.length,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (_, _) => 12.verticalSpace,
        );
  }
}

class _GoalsOnLoading extends StatelessWidget {
  const _GoalsOnLoading();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: 3,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (_, _) => 12.verticalSpace,
      itemBuilder: (context, index) {
        final goals = Goals(name: 'Goals Title', target: 300000, progress: 150000, deadline: now);
        return GoalsCard(goals: goals).skeleton();
      },
    );
  }
}
