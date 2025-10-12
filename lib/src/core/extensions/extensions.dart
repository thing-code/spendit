import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

extension ContextX on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension DoubleX on num {
  Widget get space => Gap(toDouble());
}

extension WidgetX on Widget {
  Padding paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Padding paddingSymmetric({double v = 0, double h = 0}) => Padding(
    padding: EdgeInsets.symmetric(vertical: v, horizontal: h),
    child: this,
  );

  Padding paddingOnly({
    double top = 0,
    double bottom = 0,
    double left = 0,
    double right = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      bottom: bottom,
      top: top,
      left: left,
      right: right,
    ),
    child: this,
  );
}

extension DateTimeX on DateTime {
  String get toRequest => DateFormat('yyyy-MM-dd').format(this);

  (DateTime start, DateTime end) get range {
    final startDate = DateTime(year, month, 1);
    final endDate = DateTime(year, month + 1, 0);

    return (startDate, endDate);
  }
}

extension GoRouterExt on BuildContext {
  Future<void> popUntil(String location) async {
    final delegate = GoRouter.of(this).routerDelegate;
    var config = delegate.currentConfiguration;
    var routes = config.routes.whereType<GoRoute>();

    bool predicate(GoRoute route) {
      return route.path == location;
    }

    while (routes.length > 1 && !predicate(config.last.route)) {
      config = config.remove(config.last);
      routes = config.routes.whereType<GoRoute>();
    }

    await delegate.setNewRoutePath(config);
  }
}
