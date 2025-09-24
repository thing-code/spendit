import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_routes.dart' as auth;

export 'auth_routes.dart';

part 'routes.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: auth.AuthRoute().location,
    debugLogDiagnostics: true,
    routes: [...auth.$appRoutes],
  );
}
