import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/pages/home_page.dart';

part 'main_routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData with $HomeRoute {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomePage();
  }
}