import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spendit/src/core/common.dart';
import 'package:spendit/src/features/auth/presentation/pages/auth_page.dart';

import 'main_routes.dart';

part 'auth_routes.g.dart';

@TypedGoRoute<AuthRoute>(path: '/auth')
class AuthRoute extends GoRouteData with $AuthRoute {
  AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AuthPage();
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final ref = ProviderScope.containerOf(context);

    final currentUser = ref.read(authProvider).currentUser;

    if (currentUser == null) return null;

    return HomeRoute().location;
  }
}
