import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/features/transactions/domain/models/transaction_model.dart';
import 'package:spendit/src/features/transactions/presentation/controllers/transaction_provider.dart';
import 'package:spendit_core/spendit_core.dart';

part 'transaction_controller.g.dart';

@riverpod
class TransactionController extends _$TransactionController {
  @override
  FutureOr<List<TransactionModel>> build() async {
    final result = await ref.read(transactionRepositoryProvider).read();
    return switch (result) {
      LocalResponseSuccess(:final data) => data,
      LocalResponseFailure() => [],
    };
  }

  Future<bool> add(TransactionModel value) async {
    final result = await ref.read(transactionRepositoryProvider).create(value);
    ref.invalidateSelf();
    return switch (result) {
      LocalResponseSuccess() => true,
      LocalResponseFailure() => false,
    };
  }

  Future<bool> edit(TransactionModel value) async {
    final result = await ref.read(transactionRepositoryProvider).update(value);
    ref.invalidateSelf();
    return switch (result) {
      LocalResponseSuccess() => true,
      LocalResponseFailure() => false,
    };
  }
}

@riverpod
FutureOr<List<TransactionModel>> expenses(Ref ref) async {
  final result = await ref.read(transactionRepositoryProvider).readByType(TransactionType.expense);
  final list = switch (result) {
    LocalResponseSuccess(:final data) => data,
    LocalResponseFailure() => <TransactionModel>[],
  };
  final expenses = list.whereType<TransactionExpense>().toList();
  return expenses;
}

@riverpod
FutureOr<List<TransactionModel>> incomes(Ref ref) async {
  final result = await ref.read(transactionRepositoryProvider).readByType(TransactionType.income);
  final list = switch (result) {
    LocalResponseSuccess(:final data) => data,
    LocalResponseFailure() => <TransactionModel>[],
  };
  final incomes = list.whereType<TransactionIncome>().toList();
  return incomes;
}
