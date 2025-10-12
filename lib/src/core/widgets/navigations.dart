import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/presentation/widgets/widgets.dart';

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
        color: context.colorScheme.surface,
        alignment: Alignment.center,
        child: Row(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome01,
                color: SiColors.grayscale3,
              ),
              isSelected: isHomeActive,
              padding: EdgeInsets.symmetric(horizontal: 24),
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedHome01),
              onPressed: () =>
                  _navigate(isHomeActive, () => HomeRoute().go(context)),
            ),
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedArrowUpDown,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              isSelected: isTransactionActive,
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedArrowUpDown),
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
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedTarget02,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              isSelected: isGoalsActive,
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedTarget02),
              onPressed: () =>
                  _navigate(isGoalsActive, () => GoalsRoute().push(context)),
            ),
            IconButton(
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCalculator01,
                color: SiColors.grayscale3,
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              isSelected: isBudgetingActive,
              selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedCalculator01),
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
