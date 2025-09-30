import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit/src/routes/main_routes.dart';
import 'package:thing_toast/thing_toast.dart';

import '../../../../common/common.dart';
import '../../domain/forms/forms.dart';
import '../controllers/controllers.dart';

class LoginWidget extends ConsumerWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final showPassword = ref.watch(showPasswordProvider);
    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                'Please login to continue.',
                style: TextStyle(fontSize: 16, color: SiColors.textSecondary),
              ),
            ],
          ),
          Column(
            spacing: 12,
            children: [
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
              final isLoggedIn = await ref.read(loginProvider.future);
              if (isLoggedIn && context.mounted) {
                HomeRoute().go(context);
                ThingToast(context).success(title: 'Login Success');
              }
            },
            text: 'Login',
          ),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Don't have an account? "),
                  TextSpan(
                    text: "Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: SiColors.secondary,
                      decoration: TextDecoration.underline,
                      decorationColor: SiColors.secondary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        form.reset();
                        ref.invalidate(showPasswordProvider);
                        ref
                            .read(authSwitchProvider.notifier)
                            .switchToRegister();
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
