import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/features/home/presentation/pages/home_page.dart';

part 'routers.g.dart';

enum SpendItRoute {
  home('/'),
  transaction('/transaction'),
  transactionDetail('detail'),
  goals('/goals');

  final String path;
  const SpendItRoute(this.path);
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: SpendItRoute.home.path,
    routes: [GoRoute(path: SpendItRoute.home.path, builder: (context, state) => const HomePage())],
  );
}
