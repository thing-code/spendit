import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/features/transactions/domain/models/transaction_model.dart';
import 'package:spendit/src/features/transactions/presentation/controllers/transaction_provider.dart';
import 'package:spendit_core/spendit_core.dart';

part 'balance_controller.g.dart';

@riverpod
class BalanceController extends _$BalanceController {
  @override
  FutureOr<int> build() async {
    final expenses = await ref
        .read(transactionRepositoryProvider)
        .readByType(TransactionType.expense);
    final incomes = await ref
        .read(transactionRepositoryProvider)
        .readByType(TransactionType.income);

    if (expenses is LocalResponseFailure || incomes is LocalResponseFailure) {
      logger.error('$expenses / $incomes');
      return 0;
    }

    final totalExpenses = (expenses as LocalResponseSuccess<List<TransactionModel>>).data.fold(
      0,
      (previousValue, element) => previousValue + element.amount,
    );
    final totalIncomes = (incomes as LocalResponseSuccess<List<TransactionModel>>).data.fold(
      0,
      (previousValue, element) => previousValue + element.amount,
    );

    return totalIncomes - totalExpenses;
  }
}
