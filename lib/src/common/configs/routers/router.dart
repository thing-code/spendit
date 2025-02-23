import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/dashboard/pages/dashboard_page.dart';
import '../../../features/goals/presentation/pages/goals_page.dart';
import '../../../features/saving/presentation/pages/saving_page.dart';
import '../../../features/transaction/presentation/pages/transaction_page.dart';
import '../../common.dart';

part 'router.g.dart';

enum MyRoute {
  dashboard('/dashboard'),
  transaction('/transaction'),
  goals('/goals'),
  saving('/saving');

  final String route;
  const MyRoute(this.route);
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: MyRoute.dashboard.route,
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => NavigationWrapper(state: state, child: child),
        routes: [
          GoRoute(
            path: MyRoute.dashboard.route,
            name: MyRoute.dashboard.name,
            builder: (context, state) => DashboardPage(),
          ),
          GoRoute(
            path: MyRoute.transaction.route,
            name: MyRoute.transaction.name,
            builder: (context, state) => TransactionPage(),
          ),
          GoRoute(
            path: MyRoute.goals.route,
            name: MyRoute.goals.name,
            builder: (context, state) => GoalsPage(),
          ),
          GoRoute(
            path: MyRoute.saving.route,
            name: MyRoute.saving.name,
            builder: (context, state) => SavingPage(),
          ),
        ],
      ),
    ],
  );
}
