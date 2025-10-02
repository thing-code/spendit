// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transactionsDataSource)
const transactionsDataSourceProvider = TransactionsDataSourceProvider._();

final class TransactionsDataSourceProvider
    extends
        $FunctionalProvider<
          TransactionsDataSource,
          TransactionsDataSource,
          TransactionsDataSource
        >
    with $Provider<TransactionsDataSource> {
  const TransactionsDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsDataSourceHash();

  @$internal
  @override
  $ProviderElement<TransactionsDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionsDataSource create(Ref ref) {
    return transactionsDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionsDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionsDataSource>(value),
    );
  }
}

String _$transactionsDataSourceHash() =>
    r'24e22487c4a3ab1bc2b69a58b2176a65f01e86d9';
