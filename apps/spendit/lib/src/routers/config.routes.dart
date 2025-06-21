import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_page.dart';

part 'config.routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<TransactionRoute>(path: '/transaction')
class TransactionRoute extends GoRouteData with _$TransactionRoute {
  const TransactionRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(); // TODO : Ganti ke TransactionPage
  }
}

@TypedGoRoute<FinancialGoalsRoute>(path: '/goals')
class FinancialGoalsRoute extends GoRouteData with _$FinancialGoalsRoute {
  const FinancialGoalsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(); // TODO : Ganti ke FinancialGoalsPage
  }
}

@TypedGoRoute<BudgetsRoute>(path: '/budgets')
class BudgetsRoute extends GoRouteData with _$BudgetsRoute {
  const BudgetsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Placeholder(); // TODO : Ganti ke BudgetsPage
  }
}
