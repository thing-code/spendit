import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forms.g.dart';

@riverpod
LoginForm loginForm(Ref ref) {
  return LoginForm();
}

class LoginForm extends FormGroup {
  LoginForm()
    : super({
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': FormControl<String>(validators: [Validators.required]),
      });

  FormControl<String> get email => control('email') as FormControl<String>;
  FormControl<String> get password => control('password') as FormControl<String>;
}

@riverpod
RegisterForm registerForm(Ref ref) {
  return RegisterForm();
}

class RegisterForm extends FormGroup {
  RegisterForm()
    : super({
        'email': FormControl<String>(
          validators: [Validators.required, Validators.email],
        ),
        'password': FormControl<String>(validators: [Validators.required]),
        'name': FormControl<String>(validators: [Validators.required]),
      });
  
  FormControl<String> get email => control('email') as FormControl<String>;
  FormControl<String> get password => control('password') as FormControl<String>;
  FormControl<String> get name => control('name') as FormControl<String>;
}
