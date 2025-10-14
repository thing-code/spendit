// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(totalExpense)
const totalExpenseProvider = TotalExpenseProvider._();

final class TotalExpenseProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const TotalExpenseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalExpenseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalExpenseHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalExpense(ref);
  }
}

String _$totalExpenseHash() => r'37ee24fe6e7dfb9b190475c57a7b25efae4c0871';

@ProviderFor(totalIncome)
const totalIncomeProvider = TotalIncomeProvider._();

final class TotalIncomeProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const TotalIncomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'totalIncomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$totalIncomeHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return totalIncome(ref);
  }
}

String _$totalIncomeHash() => r'08214a841ccfd62f97605c1e6ca8fec8522c374a';

@ProviderFor(balance)
const balanceProvider = BalanceProvider._();

final class BalanceProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const BalanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'balanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$balanceHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return balance(ref);
  }
}

String _$balanceHash() => r'840a9f10d376affabcf36958d7a18eed688622ec';

@ProviderFor(TransactionVisibility)
const transactionVisibilityProvider = TransactionVisibilityProvider._();

final class TransactionVisibilityProvider
    extends $NotifierProvider<TransactionVisibility, bool> {
  const TransactionVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'transactionVisibilityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$transactionVisibilityHash();

  @$internal
  @override
  TransactionVisibility create() => TransactionVisibility();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$transactionVisibilityHash() =>
    r'0a4987e4a6a21139de8671bbce132fcab9630d5d';

abstract class _$TransactionVisibility extends $Notifier<bool> {
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
