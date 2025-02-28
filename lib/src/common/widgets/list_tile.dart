import '../common.dart';

class COSListTile extends StatelessWidget {
  const COSListTile._({required this.title, this.selected = false, this.leading, this.subtitle});

  final Widget title;
  final Widget? leading;
  final Widget? subtitle;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      dense: false,
      subtitle: subtitle,
      selected: selected,
      leading: leading,
      minLeadingWidth: 16,
      selectedTileColor: context.colorScheme.primaryContainer.withValues(alpha: .2),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    );
  }

  factory COSListTile.dropdown({required String title, IconData? icon, bool selected = false}) =>
      COSListTile._(
        title: Text(title, style: kRegularTextStyle.copyWith(fontSize: 14.sp)),
        leading: icon != null ? Icon(icon, size: 18.sp) : null,
        selected: selected,
      );
      
  factory COSListTile.transaction({required Widget title, IconData? icon, Widget? subtitle}) =>
      COSListTile._(
        title: title,
        leading: icon != null ? Icon(icon, size: 18.sp) : null,
        selected: false,
        subtitle: subtitle,
      );
}
