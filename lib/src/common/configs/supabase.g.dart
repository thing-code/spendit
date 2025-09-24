// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(client)
const clientProvider = ClientProvider._();

final class ClientProvider
    extends $FunctionalProvider<SupabaseClient, SupabaseClient, SupabaseClient>
    with $Provider<SupabaseClient> {
  const ClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientHash();

  @$internal
  @override
  $ProviderElement<SupabaseClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseClient create(Ref ref) {
    return client(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseClient>(value),
    );
  }
}

String _$clientHash() => r'9d796b8a53f8642765071fb4fc6b4cd2cc96427c';

@ProviderFor(auth)
const authProvider = AuthProvider._();

final class AuthProvider
    extends $FunctionalProvider<GoTrueClient, GoTrueClient, GoTrueClient>
    with $Provider<GoTrueClient> {
  const AuthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authHash();

  @$internal
  @override
  $ProviderElement<GoTrueClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoTrueClient create(Ref ref) {
    return auth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoTrueClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoTrueClient>(value),
    );
  }
}

String _$authHash() => r'3358f799436e90274f723a2329541daf73ef154f';
