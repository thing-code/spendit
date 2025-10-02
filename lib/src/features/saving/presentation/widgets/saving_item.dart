import '../../../../common/common.dart';

class SavingItem extends StatelessWidget {
  const SavingItem({super.key, required this.saving});

  final Saving saving;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: COSListTile.saving(
        title: Text(saving.value.currency, style: kMediumTextStyle.copyWith(fontSize: 18.sp)),
        subtitle: Text(
          saving.date.getDateTime,
          style: kLightTextStyle.copyWith(color: context.colorScheme.primary.withValues(alpha: .5)),
        ),
      ),
    );
  }
}
