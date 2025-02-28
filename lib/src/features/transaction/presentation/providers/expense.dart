import 'package:spendit/src/common/common.dart';

import '../../data/repository/expense_repository_impl.dart';

part 'expense.g.dart';

@Riverpod(keepAlive: true)
class ExpenseState extends _$ExpenseState {
  @override
  FutureOr<List<Expense>> build({DateTime? date}) async {
    if (date != null) {
      final expenses = await ref.read(expenseRepositoryProvider).readByMonth(date);
      return expenses.fold((l) => [], (r) => r);
    }
    final expenses = await ref.read(expenseRepositoryProvider).read();
    return expenses.fold((l) => [], (r) => r);
  }

  Future<bool> add(Expense expense) async {
    final result = await ref.read(expenseRepositoryProvider).create(expense);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> edit(Expense expense) async {
    final result = await ref.read(expenseRepositoryProvider).update(expense);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> remove(Expense expense) async {
    final result = await ref.read(expenseRepositoryProvider).delete(expense);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }
}
