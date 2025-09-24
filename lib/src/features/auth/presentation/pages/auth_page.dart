import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/common/widgets/inputs.dart';
import 'package:spendit/src/features/auth/domain/forms/forms.dart';
import 'package:spendit/src/features/auth/presentation/controllers/controllers.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
    final showPassword = ref.watch(showPasswordProvider);
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ReactiveForm(
              formGroup: form,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Please login to continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: SiColors.textSecondary,
                        ),
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
                  SiButton.primary(onPressed: () {}, text: 'Login'),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
