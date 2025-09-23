// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forms.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginForm)
const loginFormProvider = LoginFormProvider._();

final class LoginFormProvider
    extends $FunctionalProvider<LoginForm, LoginForm, LoginForm>
    with $Provider<LoginForm> {
  const LoginFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginFormHash();

  @$internal
  @override
  $ProviderElement<LoginForm> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginForm create(Ref ref) {
    return loginForm(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginForm>(value),
    );
  }
}

String _$loginFormHash() => r'32c60a7055b61991e5520c8527b4eaaf902b0462';

@ProviderFor(registerForm)
const registerFormProvider = RegisterFormProvider._();

final class RegisterFormProvider
    extends $FunctionalProvider<RegisterForm, RegisterForm, RegisterForm>
    with $Provider<RegisterForm> {
  const RegisterFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerFormHash();

  @$internal
  @override
  $ProviderElement<RegisterForm> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterForm create(Ref ref) {
    return registerForm(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterForm>(value),
    );
  }
}

String _$registerFormHash() => r'd2c3a5dc90a2dc25b59309ee9f97c24582f81bb6';
