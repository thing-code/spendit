import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

enum ToastPosition { top, bottom }

class ToastParams {
  final String title;
  final Duration duration;
  final Duration? transitionDuration;
  final Curve curve;
  final Curve? reverseCurve;
  final String? subtitle;
  final IconData? icon;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final ToastPosition position;
  final EdgeInsets? padding;
  final Color? iconColor;
  final int titleMaxLines;
  final int subtitleMaxLines;

  ToastParams({
    required this.title,
    this.duration = const Duration(seconds: 3),
    this.transitionDuration = const Duration(milliseconds: 700),
    this.curve = Curves.easeOutExpo,
    this.reverseCurve,
    this.subtitle,
    this.icon,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.position = ToastPosition.top,
    this.padding,
    this.iconColor,
    this.titleMaxLines = 1,
    this.subtitleMaxLines = 1,
  });
}

class Toast {
  static final List<ToastParams> _dropsQueue = [];

  static bool _isShowingDrop = false;

  static void _enqueue(ToastParams drop, BuildContext context) {
    _dropsQueue.add(drop);

    if (!_isShowingDrop) {
      _showNextDrop(context);
    }
  }

  static void show(
    BuildContext context, {
    required String title,
    Duration duration = const Duration(seconds: 3),
    Duration? transitionDuration = const Duration(milliseconds: 700),
    TextStyle? textStyle,
    Curve curve = Curves.easeOutExpo,
    Curve? reverseCurve,
    String? subtitle,
    IconData? icon,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    ToastPosition position = ToastPosition.top,
    EdgeInsets? padding,
    Color? iconColor,
    int titleMaxLines = 1,
    int subtitleMaxLines = 1,
  }) {
    final drop = ToastParams(
      title: title,
      duration: duration,
      transitionDuration: transitionDuration,
      curve: curve,
      reverseCurve: reverseCurve,
      subtitle: subtitle,
      icon: icon,
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      position: position,
      padding: padding,
      iconColor: iconColor,
      titleMaxLines: titleMaxLines,
      subtitleMaxLines: subtitleMaxLines,
    );

    _enqueue(drop, context);
  }

  static void _showNextDrop(BuildContext context) {
    if (_dropsQueue.isEmpty) {
      _isShowingDrop = false;
      return;
    }

    _isShowingDrop = true;
    final drop = _dropsQueue.removeAt(0);

    OverlayEntry? currentOverlay;
    currentOverlay = OverlayEntry(
      builder: (context) => ToastWidget(
        title: drop.title,
        backgroundColor: drop.iconColor,
        duration: drop.duration,
        transitionDuration: drop.transitionDuration,
        curve: drop.curve,
        reverseCurve: drop.reverseCurve,
        subtitle: drop.subtitle,
        titleMaxLines: drop.titleMaxLines,
        subtitleMaxLines: drop.subtitleMaxLines,
        titleTextStyle: drop.titleTextStyle,
        subtitleTextStyle: drop.subtitleTextStyle,
        position: drop.position,
        padding: drop.padding,
        iconColor: drop.iconColor,
        icon: drop.icon,
        onDismiss: () {
          currentOverlay?.remove();
          currentOverlay = null;

          _showNextDrop(context);
        },
      ),
    );

    Overlay.of(context).insert(currentOverlay!);
  }
}

class ToastWidget extends StatefulWidget {
  final String title;
  final Color? backgroundColor;
  final Duration duration;
  final Duration? transitionDuration;
  final Curve curve;
  final Curve? reverseCurve;
  final VoidCallback onDismiss;
  final IconData? icon;
  final String? subtitle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final ToastPosition? position;
  final EdgeInsets? padding;
  final Color? iconColor;
  final int titleMaxLines;
  final int subtitleMaxLines;

  const ToastWidget({
    super.key,
    required this.title,
    required this.duration,
    required this.onDismiss,
    required this.curve,
    this.reverseCurve,
    this.backgroundColor,
    this.icon,
    this.subtitle,
    this.transitionDuration,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.position,
    this.padding,
    this.iconColor,
    required this.titleMaxLines,
    required this.subtitleMaxLines,
  });

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: widget.transitionDuration, vsync: this);

    _offsetAnimation =
        Tween<Offset>(
          begin: Offset(0, widget.position == ToastPosition.top ? -1 : 1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: widget.curve,
            reverseCurve: widget.reverseCurve ?? widget.curve.flipped,
          ),
        );

    _animationController.forward();

    Future.delayed(widget.duration, () {
      if (mounted) _dismissAlert();
    });

    _scrollController.addListener(() {
      if (_scrollController.offset > 30 && widget.position == ToastPosition.top) {
        _dismissAlert();
      }

      if (_scrollController.offset < -30 && widget.position == ToastPosition.bottom) {
        _dismissAlert();
      }
    });
  }

  void _dismissAlert() {
    _animationController.reverse().then((_) {
      if (mounted) widget.onDismiss();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  EdgeInsets getPadding() {
    double baseHorizontalPadding = 24;
    double baseVerticalPadding = widget.subtitle != null ? 12 : 16;

    if (widget.subtitle == null && widget.icon == null) {
      return EdgeInsets.symmetric(
        vertical: baseVerticalPadding + 4,
        horizontal: baseHorizontalPadding,
      );
    }
    if (widget.icon == null && widget.subtitle != null) {
      return EdgeInsets.symmetric(horizontal: baseHorizontalPadding, vertical: baseVerticalPadding);
    }

    if (widget.icon != null && widget.subtitle != null) {
      return EdgeInsets.symmetric(
        horizontal: baseHorizontalPadding - 4,
        vertical: baseVerticalPadding,
      );
    }

    if (widget.icon != null && widget.subtitle == null) {
      return EdgeInsets.symmetric(
        horizontal: baseVerticalPadding - 4,
        vertical: baseVerticalPadding,
      );
    }

    return EdgeInsets.all(0);
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = widget.icon != null ? 24.0 : 0;

    return Positioned(
      left: 0,
      top: widget.position == ToastPosition.top ? 0 : null,
      bottom: widget.position == ToastPosition.bottom
          ? 0 + MediaQuery.of(context).viewPadding.bottom
          : null,
      right: 0,
      child: SlideTransition(
        position: _offsetAnimation,
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          controller: _scrollController,
          hitTestBehavior: HitTestBehavior.deferToChild,
          physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 40,
                      spreadRadius: 20,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Material(
                  color: SiColors.surface,
                  borderRadius: BorderRadius.circular(1000),
                  child: Padding(
                    padding: widget.padding ?? getPadding(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.icon != null)
                          Icon(widget.icon, color: widget.iconColor ?? Colors.black),
                        SizedBox(width: widget.icon != null ? 13 : 0),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: widget.icon != null ? iconSize : 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.title,
                                  maxLines: widget.titleMaxLines,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      widget.titleTextStyle ??
                                      TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                                if (widget.subtitle != null)
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // const SizedBox(height: 2),
                                      Text(
                                        widget.subtitle!,
                                        maxLines: widget.subtitleMaxLines,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            widget.subtitleTextStyle ??
                                            TextStyle(
                                              color: Colors.black38,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
