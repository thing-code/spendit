import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:spendit_remake/src/features/transactions/domain/models/transaction_model.dart';
import 'package:spendit_remake/src/features/transactions/presentation/controllers/transaction_filter_state.dart';

part 'transaction_controller.g.dart';

@riverpod
class TransactionController extends _$TransactionController {
  @override
  FutureOr<List<TransactionModel>> build() async {
    final filter = ref.watch(transactionFilterStateProvider);
    if (filter.type != null) {
      final result = await ref.read(transactionRepositoryProvider).readByType(filter.type!);
      return switch (result) {
        LocalResponseSuccess(:final data) => data,
        LocalResponseFailure() => [],
      };
    }
    if (filter.date != null) {
      final result = await ref.read(transactionRepositoryProvider).readByMonth(filter.date!);
      return switch (result) {
        LocalResponseSuccess(:final data) => data,
        LocalResponseFailure() => [],
      };
    }
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
