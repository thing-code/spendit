// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(login)
const loginProvider = LoginProvider._();

final class LoginProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const LoginProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return login(ref);
  }
}

String _$loginHash() => r'a86c9c458f7c53c71efac2836704f83c581856a9';

@ProviderFor(register)
const registerProvider = RegisterProvider._();

final class RegisterProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const RegisterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return register(ref);
  }
}

String _$registerHash() => r'4975a5547f362301c482763eb0718fbbcd4ae292';

@ProviderFor(ShowPassword)
const showPasswordProvider = ShowPasswordProvider._();

final class ShowPasswordProvider extends $NotifierProvider<ShowPassword, bool> {
  const ShowPasswordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showPasswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showPasswordHash();

  @$internal
  @override
  ShowPassword create() => ShowPassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showPasswordHash() => r'614a088d2930b5e9985b75add83c119623b0cfd7';

abstract class _$ShowPassword extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
