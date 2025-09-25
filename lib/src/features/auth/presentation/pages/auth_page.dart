import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/features/auth/domain/enums/enums.dart';
import 'package:spendit/src/features/auth/presentation/controllers/controllers.dart';
import 'package:spendit/src/features/auth/presentation/widgets/widgets.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(authSwitchProvider);

    final body = AnimatedSwitcher(
      duration: Durations.medium3,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: switch (type) {
        AuthType.login => LoginWidget(),
        AuthType.register => RegisterWidget(),
      },
    );

    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Spacer(),
                Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: Assets.icons.icon.image(height: 56),
                  ),
                ),
                body,
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
