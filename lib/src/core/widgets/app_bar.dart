import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core.dart';

class SiAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SiAppBar({
    super.key,
    required this.title,
    this.canPop = true,
    this.action = const [],
    this.leading,
    this.centerTitle = true,
  });

  final Widget title;
  final bool centerTitle;
  final bool canPop;
  final List<Widget> action;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: canPop && context.canPop() ? _backButton(context) : null,
      actions: action,
    );
  }

  Widget _backButton(BuildContext context) {
    return leading ??
        IconButton(
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
