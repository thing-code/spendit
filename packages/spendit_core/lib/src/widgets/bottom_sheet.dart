import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class CupertinoBottomSheet<T> extends StatelessWidget {
  const CupertinoBottomSheet({super.key, this.title, required this.close, required this.builder});

  final String? title;
  final ValueChanged<T> close;
  final Widget Function(ValueChanged<T> close) builder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? '')),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: context.bottomPadding),
        child: builder(close),
      ),
    );
  }
}
