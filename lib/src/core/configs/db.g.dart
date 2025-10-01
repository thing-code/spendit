// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Db)
const dbProvider = DbProvider._();

final class DbProvider extends $AsyncNotifierProvider<Db, Database> {
  const DbProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dbProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dbHash();

  @$internal
  @override
  Db create() => Db();
}

String _$dbHash() => r'c5f30097239c8ddc644a1447a1d7c7a648c4f2a6';

abstract class _$Db extends $AsyncNotifier<Database> {
  FutureOr<Database> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Database>, Database>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Database>, Database>,
              AsyncValue<Database>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
