import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/common/common.dart';

enum SnackBarStatus { success, error }

class COSSnackBar {
  static void success(BuildContext context, {required String message}) {
    _show(context, message: message, type: SnackBarStatus.success);
  }

  static void error(BuildContext context, {required String message}) {
    _show(context, message: message, type: SnackBarStatus.error);
  }

  static void _show(
    BuildContext context, {
    required String message,
    SnackBarStatus type = SnackBarStatus.success,
  }) {
    final icon = switch (type) {
      SnackBarStatus.success => SolarIconsBold.checkCircle,
      SnackBarStatus.error => SolarIconsBold.closeCircle,
    };

    final title = switch (type) {
      SnackBarStatus.success => 'Successful',
      SnackBarStatus.error => 'Failed',
    };

    final backgroundColor = switch (type) {
      SnackBarStatus.success => context.colorScheme.primary,
      SnackBarStatus.error => context.colorScheme.error,
    };

    final foregroundColor = switch (type) {
      SnackBarStatus.success => context.colorScheme.primaryContainer,
      SnackBarStatus.error => context.colorScheme.errorContainer,
    };

    Flushbar(
      title: '',
      message: '',
      backgroundColor: backgroundColor,
      titleText: Text(
        title,
        style: kBoldTextStyle.copyWith(color: foregroundColor, fontSize: 18.sp),
      ),
      messageText: Text(
        message,
        style: kRegularTextStyle.copyWith(color: foregroundColor, fontSize: 14.sp),
      ),
      icon: Icon(icon, color: foregroundColor, size: 32.sp),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      margin: EdgeInsets.all(16.w),
      borderRadius: BorderRadius.circular(24.r),
      shouldIconPulse: false,
      duration: Duration(seconds: 5),
      blockBackgroundInteraction: true,
    ).show(context);
  }
}
