import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common.dart';

final cupertinoBtmSheetKey = GlobalKey<ScaffoldState>();

class COSCupertinoPage extends StatelessWidget {
  const COSCupertinoPage({super.key, required this.child, this.onSave});

  final Widget child;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: cupertinoBtmSheetKey, body: Column(children: [header(context), Expanded(child: child)]));
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: kMediumTextStyle.copyWith(color: context.colorScheme.error, fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: onSave,
            child: Text('Save', style: kMediumTextStyle.copyWith(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
