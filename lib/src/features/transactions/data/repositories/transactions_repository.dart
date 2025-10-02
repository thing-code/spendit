import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/data/sources/transactions_data_source.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';

part 'transactions_repository.g.dart';

@riverpod
TransactionsRepository transactionsRepository(Ref ref) {
  final datasource = ref.watch(transactionsDataSourceProvider);
  return TransactionsRepositoryImpl(datasource);
}

abstract class TransactionsRepository {
  Future<int> create(Transactions req);
  Future<int> update(Transactions req);
  Future<int> delete(int id);
  Future<List<Transactions>> readAll();
  Future<Transactions?> readById(int id);
  Future<List<Transactions>> readByFilter({
    required TransactionType type,
    DateTime? month,
  });
}

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsDataSource datasource;

  TransactionsRepositoryImpl(this.datasource);

  @override
  Future<int> create(Transactions req) => datasource.create(req);

  @override
  Future<int> delete(int id) => datasource.delete(id);

  @override
  Future<List<Transactions>> readAll() => datasource.readAll();

  @override
  Future<List<Transactions>> readByFilter({
    required TransactionType type,
    DateTime? month,
  }) {
    return datasource.readByFilter(type: type, month: month);
  }

  @override
  Future<Transactions?> readById(int id) => datasource.readById(id);

  @override
  Future<int> update(Transactions req) => datasource.update(req);
}
