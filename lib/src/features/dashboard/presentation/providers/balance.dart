import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../transaction/presentation/providers/expense.dart';
import '../../../transaction/presentation/providers/income.dart';

part 'balance.g.dart';

@riverpod
class BalanceState extends _$BalanceState {
  @override
  FutureOr<int> build() async {
    final income = await ref.watch(
      incomeStateProvider().selectAsync((v) => v.fold(0, (p, n) => p + n.value)),
    );
    final expense = await ref.watch(
      expenseStateProvider().selectAsync((v) => v.fold(0, (p, n) => p + n.value)),
    );
    return income - expense;
  }
}
