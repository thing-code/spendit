import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendit/src/core/core.dart';

class SiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SiAppBar({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultTextStyle(
        style:
            context.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ) ??
            TextStyle(),
        child: title,
      ),
      automaticallyImplyLeading: false,
      leading: context.canPop() ? _backButton(context) : null,
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: SiColors.card,
        foregroundColor: context.colorScheme.onPrimaryContainer,
      ),
      onPressed: context.pop,
      icon: Icon(Icons.arrow_back, size: 20),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}