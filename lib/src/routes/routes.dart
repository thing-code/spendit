import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/home/presentation/pages/home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: HomeRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );
}
