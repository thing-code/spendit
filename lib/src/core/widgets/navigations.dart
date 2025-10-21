import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../features/transactions/presentation/widgets/widgets.dart';
import '../core.dart';

class SiNavigationWidget extends StatelessWidget {
  const SiNavigationWidget({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final location = state.uri.toString();

    return Scaffold(
      body: child,
      bottomNavigationBar: _SiNavigationBar(location),
    );
  }
}

class _SiNavigationBar extends StatelessWidget {
  const _SiNavigationBar(this.currentPath);

  final String currentPath;

  @override
  Widget build(BuildContext context) {
    final isHomeActive = currentPath == HomeRoute().location;
    final isTransactionActive = currentPath == TransactionRoute().location;
    final isGoalsActive = currentPath == GoalsRoute().location;
    final isBudgetingActive = currentPath == BudgetingRoute().location;
    final oneTap = Throttler();

    return SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          boxShadow: SiShadows.medium,
          borderRadius: BorderRadius.circular(1000),
        ),
        alignment: Alignment.center,
        child: Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(SolarIconsOutline.home, color: SiColors.grayscale3),
              isSelected: isHomeActive,
              padding: EdgeInsets.symmetric(horizontal: 16),
              selectedIcon: Icon(SolarIconsBold.home),
              onPressed: () =>
                  _navigate(isHomeActive, () => HomeRoute().go(context)),
            ),
            IconButton(
              icon: Icon(
                SolarIconsOutline.transferVertical,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              isSelected: isTransactionActive,
              selectedIcon: Icon(SolarIconsBold.transferVertical),
              onPressed: () => _navigate(
                isTransactionActive,
                () => TransactionRoute().push(context),
              ),
            ),
            IconButton.filled(
              padding: EdgeInsets.symmetric(horizontal: 24),
              onPressed: () => oneTap.run(() async {
                await showTransactionForm(context);
              }),
              icon: Icon(Icons.add),
            ),
            IconButton(
              icon: Icon(SolarIconsOutline.cup1, color: SiColors.grayscale3),
              padding: EdgeInsets.symmetric(horizontal: 16),
              isSelected: isGoalsActive,
              selectedIcon: Icon(SolarIconsBold.cup1),
              onPressed: () =>
                  _navigate(isGoalsActive, () => GoalsRoute().push(context)),
            ),
            IconButton(
              icon: Icon(
                SolarIconsOutline.calculatorMinimalistic,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              isSelected: isBudgetingActive,
              selectedIcon: Icon(SolarIconsBold.calculatorMinimalistic),
              onPressed: () => _navigate(
                isBudgetingActive,
                () => BudgetingRoute().push(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(bool check, VoidCallback navigate) {
    if (check) return;
    navigate();
  }
}
