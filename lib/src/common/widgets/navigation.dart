import '../common.dart';

class COSNavigation extends ConsumerWidget {
  const COSNavigation({super.key, required this.child, required this.state});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(size: 28.sp, color: context.colorScheme.primary);
            }
            return IconThemeData(color: Colors.grey.shade400, size: 28.sp);
          }),
          backgroundColor: context.colorScheme.surface,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: selectedIndex(state),
          onDestinationSelected: (value) => onDestinationSelected(value, context),
          destinations: [
            NavigationDestination(
              icon: Icon(SolarIconsOutline.compass),
              selectedIcon: Icon(SolarIconsBold.compass),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(SolarIconsOutline.billList),
              selectedIcon: Icon(SolarIconsBold.billList),
              label: 'Transactions',
            ),
            COSAddTransactionButton(),
            NavigationDestination(
              icon: Icon(SolarIconsOutline.radar2),
              selectedIcon: Icon(SolarIconsBold.radar2),
              label: 'Goals',
            ),
            NavigationDestination(
              icon: Icon(SolarIconsOutline.walletMoney),
              selectedIcon: Icon(SolarIconsBold.walletMoney),
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
