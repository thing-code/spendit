import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/routers/config.routes.dart';

part 'routers.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(initialLocation: '/', navigatorKey: navigatorKey, routes: $appRoutes);
}
