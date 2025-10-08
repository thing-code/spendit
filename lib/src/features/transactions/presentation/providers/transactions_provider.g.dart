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
    r'3f97bb9fe1903072d2cbef9b59a0839baba0feaf';

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

String _$expenseControllerHash() => r'3f370a3ba36aba05629a092119297f753608c0e5';

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

String _$incomeControllerHash() => r'd7b29866163bf8ba131170acc620a0c678bfacce';

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
