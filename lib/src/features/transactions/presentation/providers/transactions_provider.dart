import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/core/core.dart';

import '../../data/repositories/transactions_repository.dart';
import '../../domain/models/models.dart';

part 'transactions_provider.g.dart';

@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  @override
  FutureOr<List<Transactions>> build() async {
    return ref.read(transactionsRepositoryProvider).getAll();
  }

  Future<int> createTransaction(Transactions req) async {
    final id = await ref.read(transactionsRepositoryProvider).create(req);
    if (id != 0) _invalidate();
    return id;
  }

  Future<int> updateTransaction(Transactions req) async {
    if (req.id == null) return 0;
    final id = await ref
        .read(transactionsRepositoryProvider)
        .update(req.id!, req);
    if (id != 0) _invalidate();
    return id;
  }

  Future<int> deleteTransaction(int id) async {
    final deleted = await ref.read(transactionsRepositoryProvider).delete(id);
    if (deleted != 0) _invalidate();
    return deleted;
  }

  void _invalidate() {
    ref.invalidateSelf();
    ref.invalidate(expenseProvider);
    ref.invalidate(incomeProvider);
  }
}

@riverpod
class ExpenseNotifier extends _$ExpenseNotifier {
  @override
  FutureOr<List<Transactions>> build() async {
    return ref
        .read(transactionsRepositoryProvider)
        .getByFilter(type: TransactionType.expense);
  }
}

@riverpod
class IncomeNotifier extends _$IncomeNotifier {
  @override
  FutureOr<List<Transactions>> build() async {
    return ref
        .read(transactionsRepositoryProvider)
        .getByFilter(type: TransactionType.income);
  }
}
