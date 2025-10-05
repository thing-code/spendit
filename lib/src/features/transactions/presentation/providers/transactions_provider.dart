import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/core/core.dart';

import '../../data/repositories/transactions_repository.dart';
import '../../domain/models/models.dart';

part 'transactions_provider.g.dart';

@riverpod
class TransactionsController extends _$TransactionsController {
  @override
  FutureOr<List<Transactions>> build() async {
    return ref.read(transactionsRepositoryProvider).getAll();
  }
}

@riverpod
class ExpenseController extends _$ExpenseController {
  @override
  FutureOr<List<Transactions>> build() async {
    return ref
        .read(transactionsRepositoryProvider)
        .getByFilter(type: TransactionType.expense);
  }
}

@riverpod
class IncomeController extends _$IncomeController {
  @override
  FutureOr<List<Transactions>> build() async {
    return ref
        .read(transactionsRepositoryProvider)
        .getByFilter(type: TransactionType.income);
  }
}
