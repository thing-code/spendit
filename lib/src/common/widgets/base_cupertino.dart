import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common.dart';

class BaseCupertinoPage<T> extends StatelessWidget {
  const BaseCupertinoPage({super.key, required this.child, this.onSave});

  final Widget child;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [header(context), Expanded(child: child)]));
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'Cancel',
              style: kSemiBoldTextStyle.copyWith(color: context.colorScheme.error, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: onSave ?? context.pop,
            child: Text('Save', style: kSemiBoldTextStyle.copyWith(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
