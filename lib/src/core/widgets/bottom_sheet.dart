import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendit/src/core/core.dart';

/// Class for showing BottomSheet
class SiBottomSheet<T> {
  final BuildContext context;

  SiBottomSheet(this.context);

  Future<T?> show({
    bool isDismissable = true,
    bool enableDrag = true,
    bool showIndicator = false,
    bool showCloseButton = true,
    Widget? title,
    required Widget Function(ValueChanged<T?> close) builder,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: isDismissable,
      enableDrag: isDismissable && enableDrag,
      builder: (ctx) => _BottomSheetWidget<T>(
        showIndicator: showIndicator,
        showCloseButton: showCloseButton,
        title: title,
        isDismissable: isDismissable,
        onClose: (value) => context.pop(value),
        builder: builder,
      ),
    );
  }
}

/// Main BottomSheetWidget with Indicator and AppBar
class _BottomSheetWidget<T> extends StatelessWidget {
  const _BottomSheetWidget({
    super.key,
    required this.onClose,
    this.isDismissable = true,
    this.showCloseButton = true,
    this.showIndicator = false,
    this.title,
    required this.builder,
  });

  final void Function(T? value) onClose;
  final bool showCloseButton;
  final bool isDismissable;
  final bool showIndicator;
  final Widget? title;
  final Widget Function(ValueChanged<T?> close) builder;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: isDismissable,
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: IntrinsicHeight(
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: context.colorScheme.surface,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ?indicator,
                if (title != null)
                  _BottomSheetAppBar(
                    onBackPressed: showCloseButton ? () => onClose(null) : null,
                    title: title,
                    centerTitle: true,
                  ),
                Expanded(child: builder(onClose)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget? get indicator {
    if (!showIndicator) return null;
    return Center(
      child: Container(
        height: 4,
        width: 80,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: SiColors.textPrimary,
        ),
      ),
    );
  }
}

/// Widget for Title of BottomSheet
class _BottomSheetAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _BottomSheetAppBar({
    this.onBackPressed,
    this.title,
    this.centerTitle = true,
  });

  /// Action for back button
  final VoidCallback? onBackPressed;

  /// Title of [_BottomSheetAppBar]
  final Widget? title;

  /// Align title center if `true`. Default is `true`.
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: onBackPressed != null
          ? IconButton(
              onPressed: onBackPressed,
              icon: Icon(Amicons.vuesax_arrow_left_2),
            )
          : null,
      centerTitle: centerTitle,
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
