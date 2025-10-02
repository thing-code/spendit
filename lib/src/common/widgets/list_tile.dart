import '../common.dart';

class COSListTile extends StatelessWidget {
  const COSListTile._({
    required this.title,
    this.selected = false,
    this.leading,
    this.subtitle,
    this.color,
    this.borderRadius,
  });

  final Widget title;
  final Widget? leading;
  final Widget? subtitle;
  final bool selected;
  final Color Function(BuildContext c)? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subtitle,
      selected: selected,
      leading: leading,
      minLeadingWidth: 16.w,
      tileColor: color?.call(context),
      minVerticalPadding: 12.h,
      dense: true,
      selectedTileColor: context.colorScheme.primaryContainer.withValues(alpha: .2),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 8.r)),
    );
  }

  factory COSListTile.dropdown({required String title, IconData? icon, bool selected = false}) =>
      COSListTile._(
        title: Text(title, style: kRegularTextStyle.copyWith(fontSize: 14.sp)),
        leading: icon != null ? Icon(icon, size: 18.sp) : null,
        selected: selected,
      );

  factory COSListTile.transaction({
    required Widget title,
    required IconData icon,
    Widget? subtitle,
    Color? iconColor,
  }) => COSListTile._(
    title: title,
    leading: Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: iconColor?.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, size: 28.sp, color: iconColor),
    ),
    selected: false,
    color: (c) => c.colorScheme.onPrimary,
    subtitle: subtitle,
    borderRadius: 12.r,
  );

  factory COSListTile.saving({required Widget title, required Widget subtitle}) =>
      COSListTile._(title: title, subtitle: subtitle);
}
