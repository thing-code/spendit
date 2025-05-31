import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/transactions/domain/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<LocalResponseModel<int>> create(TransactionModel value);
  Future<LocalResponseModel<List<TransactionModel>>> read();
  Future<LocalResponseModel<List<TransactionModel>>> readByMonth(DateTime month);
  Future<LocalResponseModel<List<TransactionModel>>> readByType(TransactionType type);
  Future<LocalResponseModel<int>> update(TransactionModel value);
}
