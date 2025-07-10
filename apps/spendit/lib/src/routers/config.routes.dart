import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendit/src/features/transactions/presentation/pages/transaction_page.dart';
import 'package:spendit_core/spendit_core.dart';

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
  const TransactionRoute(this.type);

  final TransactionType type;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TransactionPage(type: type);
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
