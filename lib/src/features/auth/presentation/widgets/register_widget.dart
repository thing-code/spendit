import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:spendit/src/features/auth/domain/forms/forms.dart';
import 'package:spendit/src/features/auth/presentation/controllers/controllers.dart';
import 'package:thing_toast/thing_toast.dart';

import '../../../../common/common.dart';

class RegisterWidget extends ConsumerWidget {
  const RegisterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(registerFormProvider);
    final showPassword = ref.watch(showPasswordProvider);

    void switchToLogin() {
      form.reset();
      ref.invalidate(showPasswordProvider);
      ref.read(authSwitchProvider.notifier).switchToLogin();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 24,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create New Account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
            Text(
              'Register to get started.',
              style: TextStyle(fontSize: 16, color: SiColors.textSecondary),
            ),
          ],
        ),
        Column(
          spacing: 12,
          children: [
            SiTextInput(
              control: form.name,
              label: 'Name',
              placeholder: 'Enter your name',
              prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedUserAccount,
                color: SiColors.primary,
              ),
            ),
            SiTextInput(
              control: form.email,
              label: 'Email',
              placeholder: 'Enter your email',
              prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedMail01,
                color: SiColors.primary,
              ),
            ),
            SiTextInput(
              control: form.password,
              label: 'Password',
              placeholder: 'Enter your password',
              obsecureText: !showPassword,
              prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedLockPassword,
                color: SiColors.primary,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(showPasswordProvider.notifier).toggle();
                },
                icon: HugeIcon(
                  icon: !showPassword
                      ? HugeIcons.strokeRoundedViewOff
                      : HugeIcons.strokeRoundedView,
                  color: SiColors.primary,
                ),
              ),
            ),
          ],
        ),
        SiButton.primary(
          onPressed: () async {
            if (form.invalid) return;
            final isRegistered = await ref.read(registerProvider.future);
            if (isRegistered && context.mounted) {
              ThingToast(context).success(
                title: 'Register Success',
                subtitle: 'Your account have been registered successfully',
              );
            }
          },
          text: 'Register',
        ),
        Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "Already have an account? "),
                TextSpan(
                  text: "Login Now",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: SiColors.secondary,
                    decoration: TextDecoration.underline,
                    decorationColor: SiColors.secondary,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = switchToLogin,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
