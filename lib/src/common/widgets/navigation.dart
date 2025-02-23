// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/common/common.dart';

class NavigationWrapper extends ConsumerWidget {
  const NavigationWrapper({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          iconTheme: WidgetStatePropertyAll(IconThemeData(size: 28)),
          backgroundColor: context.colorScheme.surface,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: selectedIndex(state),
          onDestinationSelected: (value) => onDestinationSelected(value, context),
          destinations: [
            NavigationDestination(
              icon: Icon(SolarIconsOutline.compass, color: Colors.grey.shade400),
              selectedIcon: Icon(SolarIconsBold.compass, color: context.colorScheme.primary),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(SolarIconsOutline.billList, color: Colors.grey.shade400),
              selectedIcon: Icon(SolarIconsBold.billList, color: context.colorScheme.primary),
              label: 'Transactions',
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    elevation: 0,
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
            NavigationDestination(
              icon: Icon(SolarIconsOutline.rocket, color: Colors.grey.shade400),
              selectedIcon: Icon(SolarIconsBold.rocket, color: context.colorScheme.primary),
              label: 'Goals',
            ),
            NavigationDestination(
              icon: Icon(SolarIconsOutline.wallet, color: Colors.grey.shade400),
              selectedIcon: Icon(SolarIconsBold.wallet, color: context.colorScheme.primary),
              label: 'Saving',
            ),
          ],
        ),
      ),
    );
  }

  int selectedIndex(GoRouterState state) {
    final String location = state.uri.toString();

    if (location == (MyRoute.dashboard.route)) {
      return 0;
    }
    if (location == (MyRoute.transaction.route)) {
      return 1;
    }
    if (location == (MyRoute.goals.route)) {
      return 3;
    }
    if (location == (MyRoute.saving.route)) {
      return 4;
    }
    return 0;
  }

  void onDestinationSelected(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(MyRoute.dashboard.route);
      case 1:
        context.go(MyRoute.transaction.route);
      case 3:
        context.go(MyRoute.goals.route);
      case 4:
        context.go(MyRoute.saving.route);
    }
  }
}
