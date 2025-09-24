import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spendit/src/features/auth/presentation/pages/auth_page.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<AuthRoute>(path: '/auth')
class AuthRoute extends GoRouteData with $AuthRoute {
  AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AuthPage();
  }
}
