import 'package:flutter/widgets.dart';

enum SpendItRoute {
  home('/'),
  transaction('/transaction'),
  transactionDetail('detail'),
  goals('/goals');

  final String path;
  const SpendItRoute(this.path);
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');