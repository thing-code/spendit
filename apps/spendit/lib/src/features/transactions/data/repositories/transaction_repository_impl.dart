import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/transactions/data/datasources/transaction_data_source.dart';
import 'package:spendit_remake/src/features/transactions/domain/models/transaction_model.dart';
import 'package:spendit_remake/src/features/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionDataSource datasource;

  TransactionRepositoryImpl(this.datasource);

  @override
  Future<LocalResponseModel<int>> create(TransactionModel value) async {
    try {
      final result = await datasource.create(value);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<List<TransactionModel>>> read() async {
    try {
      final result = await datasource.read();
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<List<TransactionModel>>> readByMonth(DateTime month) async {
    try {
      final result = await datasource.readByMonth(month);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<int>> update(TransactionModel value) async {
    try {
      final result = await datasource.update(value);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<List<TransactionModel>>> readByType(TransactionType type) async {
    try {
      final result = await datasource.readByType(type);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }
}
