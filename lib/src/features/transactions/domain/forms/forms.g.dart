// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forms.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(expenseForm)
const expenseFormProvider = ExpenseFormProvider._();

final class ExpenseFormProvider
    extends
        $FunctionalProvider<
          TransactionExpenseForm,
          TransactionExpenseForm,
          TransactionExpenseForm
        >
    with $Provider<TransactionExpenseForm> {
  const ExpenseFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseFormHash();

  @$internal
  @override
  $ProviderElement<TransactionExpenseForm> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionExpenseForm create(Ref ref) {
    return expenseForm(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionExpenseForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionExpenseForm>(value),
    );
  }
}

String _$expenseFormHash() => r'c9836640a5370b1a6ee25d4add27b70cc9cbf2bd';

@ProviderFor(incomeForm)
const incomeFormProvider = IncomeFormProvider._();

final class IncomeFormProvider
    extends
        $FunctionalProvider<
          TransactionIncomeForm,
          TransactionIncomeForm,
          TransactionIncomeForm
        >
    with $Provider<TransactionIncomeForm> {
  const IncomeFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incomeFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incomeFormHash();

  @$internal
  @override
  $ProviderElement<TransactionIncomeForm> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionIncomeForm create(Ref ref) {
    return incomeForm(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionIncomeForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionIncomeForm>(value),
    );
  }
}

String _$incomeFormHash() => r'cda382f8cde53bfe092abf0fa3464590f726ae31';

@ProviderFor(goalsForm)
const goalsFormProvider = GoalsFormProvider._();

final class GoalsFormProvider
    extends
        $FunctionalProvider<
          TransactionGoalsForm,
          TransactionGoalsForm,
          TransactionGoalsForm
        >
    with $Provider<TransactionGoalsForm> {
  const GoalsFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goalsFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goalsFormHash();

  @$internal
  @override
  $ProviderElement<TransactionGoalsForm> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TransactionGoalsForm create(Ref ref) {
    return goalsForm(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TransactionGoalsForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TransactionGoalsForm>(value),
    );
  }
}

String _$goalsFormHash() => r'4ea50f210e36ebf2ebb018bf8bd43d541c1f7ccf';
