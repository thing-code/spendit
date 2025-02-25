import 'package:flutter/material.dart';
import 'package:spendit/main.dart';
import 'package:spendit/src/common/common.dart';

enum SnackBarStatus { success, error }

class COSSnackBar {
  void success({required String message}) {
    _show(message: message, type: SnackBarStatus.success);
  }

  void error({required String message}) {
    _show(message: message, type: SnackBarStatus.error);
  }

  void _show({
    required String message,
    SnackBarStatus type = SnackBarStatus.success,
  }) {
    final icon = switch (type) {
      SnackBarStatus.success => Icons.check_circle,
      SnackBarStatus.error => Icons.error,
    };


    scaffoldMsgKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: Color(0xFF1C304F),
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        duration: Duration(milliseconds: 1200),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Row(
          spacing: 16,
          children: [
            Icon(icon, color: Colors.white),
            Flexible(
              child: Text(
                message,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: kSemiBoldTextStyle.copyWith(
                    color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
