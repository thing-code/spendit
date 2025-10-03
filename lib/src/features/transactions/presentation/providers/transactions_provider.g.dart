// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transactions)
const transactionsProvider = TransactionsProvider._();

final class TransactionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Transactions>>,
          List<Transactions>,
          FutureOr<List<Transactions>>
        >
    with
        $FutureModifier<List<Transactions>>,
        $FutureProvider<List<Transactions>> {
  const TransactionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsHash();

  @$internal
  @override
  $FutureProviderElement<List<Transactions>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Transactions>> create(Ref ref) {
    return transactions(ref);
  }
}

String _$transactionsHash() => r'8b8356b8693ceea9391a6e7c3af7d7ee590d9a06';
