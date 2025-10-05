// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TransactionsController)
const transactionsControllerProvider = TransactionsControllerProvider._();

final class TransactionsControllerProvider
    extends $AsyncNotifierProvider<TransactionsController, List<Transactions>> {
  const TransactionsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionsControllerHash();

  @$internal
  @override
  TransactionsController create() => TransactionsController();
}

String _$transactionsControllerHash() =>
    r'06e95d2c836664e32b1b9164c02d299a86c93928';

abstract class _$TransactionsController
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

@ProviderFor(ExpenseController)
const expenseControllerProvider = ExpenseControllerProvider._();

final class ExpenseControllerProvider
    extends $AsyncNotifierProvider<ExpenseController, List<Transactions>> {
  const ExpenseControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseControllerHash();

  @$internal
  @override
  ExpenseController create() => ExpenseController();
}

String _$expenseControllerHash() => r'2b31905b9803f35e031a7298a4b0422655b6b862';

abstract class _$ExpenseController extends $AsyncNotifier<List<Transactions>> {
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

@ProviderFor(IncomeController)
const incomeControllerProvider = IncomeControllerProvider._();

final class IncomeControllerProvider
    extends $AsyncNotifierProvider<IncomeController, List<Transactions>> {
  const IncomeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incomeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incomeControllerHash();

  @$internal
  @override
  IncomeController create() => IncomeController();
}

String _$incomeControllerHash() => r'45224ebedcdf141ea0473d8470b4a813e948bbde';

abstract class _$IncomeController extends $AsyncNotifier<List<Transactions>> {
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
