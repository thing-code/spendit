import 'package:spendit/src/common/common.dart';

final kBoldTextStyle = TextStyle(fontWeight: FontWeight.bold, height: 1.2);
final kSemiBoldTextStyle = TextStyle(fontWeight: FontWeight.w600, height: 1.2);
final kMediumTextStyle = TextStyle(fontWeight: FontWeight.w500, height: 1.2);
final kRegularTextStyle = TextStyle(fontWeight: FontWeight.w400, height: 1.2);
final kLightTextStyle = TextStyle(fontWeight: FontWeight.w300, height: 1.2);

InputDecoration inputDecoration(BuildContext context, {String? hint, Widget? prefixIcon}) {
  return InputDecoration(
    counter: 0.verticalSpace,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    border: baseInputBorder(),
    enabledBorder: baseInputBorder(),
    focusedBorder: baseInputBorder(color: context.colorScheme.primary.withAlpha(200)),
    errorBorder: baseInputBorder(color: context.colorScheme.error),
    hintText: hint,
    hintStyle: kRegularTextStyle.copyWith(color: Colors.grey.shade300, fontSize: 14),
    filled: true,
    fillColor: Colors.white30,
    prefixIcon: prefixIcon,
    prefixIconColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.focused) && !states.contains(WidgetState.error)) {
        return context.colorScheme.primary;
      }
      if (states.contains(WidgetState.error)) {
        return context.colorScheme.error;
      }
      return Colors.grey.shade300;
    }),
  );
}

OutlineInputBorder baseInputBorder({Color? color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? Colors.grey.shade300, width: 1.5),
    borderRadius: BorderRadius.circular(12),
  );
}

final now = DateTime.now();

final thisMonth = now.month;

final thisYear = now.year;
