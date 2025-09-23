import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/common/widgets/inputs.dart';
import 'package:spendit/src/features/auth/domain/forms/forms.dart';
import 'package:spendit/src/gen/assets.gen.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(loginFormProvider);
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
                      ),
                      SiTextInput(
                        control: form.password,
                        label: 'Password',
                        placeholder: 'Enter your password',
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
