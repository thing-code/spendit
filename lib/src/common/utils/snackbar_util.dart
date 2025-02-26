import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      SnackBarStatus.success => Icons.check_circle,
      SnackBarStatus.error => Icons.error,
    };

    final title = switch (type) {
      SnackBarStatus.success => 'SUCCESS',
      SnackBarStatus.error => 'FAIL',
    };

    Flushbar(
      title: '',
      message: '',
      backgroundColor: Color(0xFF1C304F),
      titleText: Text(title, style: kSemiBoldTextStyle.copyWith(color: Colors.white, fontSize: 14)),
      messageText: Text(
        message,
        style: kRegularTextStyle.copyWith(color: Colors.white, fontSize: 14),
      ),
      icon: Icon(icon, color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      shouldIconPulse: false,
      duration: Duration(seconds: 3),
    ).show(context);
  }
}
