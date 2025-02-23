import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';

import '../../data/repository/expense_repository_impl.dart';

part 'expense.g.dart';

@Riverpod(keepAlive: true)
class Expense extends _$Expense {
  @override
  FutureOr<List<ExpenseModel>> build() async {
    final expenses = await ref.read(expenseRepositoryProvider).read();
    return expenses.fold((l) => [], (r) => r);
  }

  Future<bool> add(ExpenseModel expense) async {
    final result = await ref.read(expenseRepositoryProvider).create(expense);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> edit(ExpenseModel expense) async {
    final result = await ref.read(expenseRepositoryProvider).update(expense);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> delete(ExpenseModel expense) async {
    final result = await ref.read(expenseRepositoryProvider).delete(expense);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }
}
