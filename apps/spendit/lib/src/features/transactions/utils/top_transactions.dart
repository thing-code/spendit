import 'package:spendit/src/features/transactions/domain/models/transaction_model.dart';
import 'package:spendit_core/spendit_core.dart';

List<TransactionExpense> getTopTransactions(List<TransactionExpense> transactions) {
  transactions.sort((a, b) => b.amount.compareTo(a.amount));

  Map<ExpenseCategory, TransactionExpense> uniqueTypes = {};

  for (var transaction in transactions) {
    if (!uniqueTypes.containsKey(transaction.category)) {
      uniqueTypes[transaction.category] = transaction;

      if (uniqueTypes.length == 3) break;
    }
  }

  return uniqueTypes.values.toList();
}
