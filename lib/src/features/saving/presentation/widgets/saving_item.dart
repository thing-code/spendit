import '../../../../common/common.dart';

class SavingItem extends StatelessWidget {
  const SavingItem({super.key, required this.saving});

  final Saving saving;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.colorScheme.primary),
        borderRadius: BorderRadius.circular(12.r),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
      title: Text(saving.value.currency, style: kMediumTextStyle.copyWith(fontSize: 16.sp)),
      subtitle: Text(saving.date.getDateTime),
    );
  }
}