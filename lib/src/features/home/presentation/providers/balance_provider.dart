import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../transactions/presentation/providers/transactions_provider.dart';

part 'balance_provider.g.dart';

@riverpod
FutureOr<int> totalExpense(Ref ref) async {
  ref.invalidate(expenseProvider);
  final expense = await ref.watch(
    expenseProvider.selectAsync((data) => data.fold(0, (p, c) => p + c.amount)),
  );
  return expense;
}

@riverpod
FutureOr<int> totalIncome(Ref ref) async {
  ref.invalidate(incomeProvider);
  final income = await ref.watch(
    incomeProvider.selectAsync((data) => data.fold(0, (p, c) => p + c.amount)),
  );
  return income;
}

@riverpod
FutureOr<int> balance(Ref ref) async {
  final expense = await ref.watch(totalExpenseProvider.selectAsync((v) => v));
  final income = await ref.watch(totalIncomeProvider.selectAsync((v) => v));
  return income - expense;
}

@Riverpod(keepAlive: true)
class TransactionVisibility extends _$TransactionVisibility {
  @override
  bool build() => true;

  void toggle() {
    state = !state;
  }
}
