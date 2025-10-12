// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionNotifier)
const transactionProvider = TransactionNotifierProvider._();

final class TransactionNotifierProvider
    extends $AsyncNotifierProvider<TransactionNotifier, List<Transactions>> {
  const TransactionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionNotifierHash();

  @$internal
  @override
  TransactionNotifier create() => TransactionNotifier();
}

String _$transactionNotifierHash() =>
    r'f16897ebe13108c9ced7b27e157e7e99038ecb09';

abstract class _$TransactionNotifier
    extends $AsyncNotifier<List<Transactions>> {
  FutureOr<List<Transactions>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Transactions>>, List<Transactions>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transactions>>, List<Transactions>>,
              AsyncValue<List<Transactions>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ExpenseNotifier)
const expenseProvider = ExpenseNotifierProvider._();

final class ExpenseNotifierProvider
    extends $AsyncNotifierProvider<ExpenseNotifier, List<Transactions>> {
  const ExpenseNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseNotifierHash();

  @$internal
  @override
  ExpenseNotifier create() => ExpenseNotifier();
}

String _$expenseNotifierHash() => r'88410cf2cca9c1b171eedfcd38ccc343941a0bff';

abstract class _$ExpenseNotifier extends $AsyncNotifier<List<Transactions>> {
  FutureOr<List<Transactions>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Transactions>>, List<Transactions>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transactions>>, List<Transactions>>,
              AsyncValue<List<Transactions>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(IncomeNotifier)
const incomeProvider = IncomeNotifierProvider._();

final class IncomeNotifierProvider
    extends $AsyncNotifierProvider<IncomeNotifier, List<Transactions>> {
  const IncomeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incomeNotifierHash();

  @$internal
  @override
  IncomeNotifier create() => IncomeNotifier();
}

String _$incomeNotifierHash() => r'6fc39f636f99adf2d7c781d6485be0feb3b34955';

abstract class _$IncomeNotifier extends $AsyncNotifier<List<Transactions>> {
  FutureOr<List<Transactions>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<Transactions>>, List<Transactions>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Transactions>>, List<Transactions>>,
              AsyncValue<List<Transactions>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
