// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authSource)
const authSourceProvider = AuthSourceProvider._();

final class AuthSourceProvider
    extends $FunctionalProvider<AuthSource, AuthSource, AuthSource>
    with $Provider<AuthSource> {
  const AuthSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authSourceHash();

  @$internal
  @override
  $ProviderElement<AuthSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthSource create(Ref ref) {
    return authSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthSource>(value),
    );
  }
}

String _$authSourceHash() => r'969717aa4935ab57626cebf079d074cb6c97a365';
