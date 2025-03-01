import '../../../../common/common.dart';

class GoalsCard extends StatelessWidget {
  const GoalsCard({super.key, required this.goals, this.onEdit, this.onAddFunds});

  final Goals goals;
  final VoidCallback? onEdit;
  final VoidCallback? onAddFunds;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shadowColor: context.colorScheme.primary,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 16.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(goals.name, style: kSemiBoldTextStyle.copyWith(fontSize: 20.sp)),
                Text(
                  'Due to ${goals.deadline.getCompact}',
                  style: kRegularTextStyle.copyWith(
                    color: context.colorScheme.primary.withAlpha(200),
                  ),
                ),
              ],
            ),
            Column(
              spacing: 6.h,
              children: [
                COSLinearProgress(
                  value: goals.progress == 0 ? 0 : goals.target / goals.progress,
                  height: 16,
                  color: context.colorScheme.primary,
                  gap: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(goals.progress.compactCurrency),
                    Text(goals.target.compactCurrency),
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
                    onPressed: onAddFunds,
                    label: Text('Add Funds'),
                    icon: Icon(Icons.add, color: context.colorScheme.primary),
                  ),
                ),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onEdit,
                    label: Text('Edit Goal'),
                    icon: Icon(SolarIconsOutline.penNewSquare),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
