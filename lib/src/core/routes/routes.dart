import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../widgets/navigations.dart';
import '../../features/budgeting/presentation/pages/budgeting_page.dart';
import '../../features/goals/presentation/pages/goals_page.dart';
import '../../features/transactions/presentation/pages/transactions_page.dart';

import '../../features/home/presentation/pages/home_page.dart';

part 'routes.g.dart';

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: HomeRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}

@TypedShellRoute<NavigationRoute>(
  routes: [
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<TransactionRoute>(path: '/transactions'),
    TypedGoRoute<GoalsRoute>(path: '/goals'),
    TypedGoRoute<BudgetingRoute>(path: '/budgeting'),
  ],
)
class NavigationRoute extends ShellRouteData {
  NavigationRoute();

  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Shell');

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return SiNavigationWidget(state: state, child: navigator);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}

class TransactionRoute extends GoRouteData with $TransactionRoute {
  TransactionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TransactionsPage();
  }
}

class GoalsRoute extends GoRouteData with $GoalsRoute {
  GoalsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return GoalsPage();
  }
}

class BudgetingRoute extends GoRouteData with $BudgetingRoute {
  BudgetingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BudgetingPage();
  }
}
