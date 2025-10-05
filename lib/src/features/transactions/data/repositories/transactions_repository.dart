import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';
import '../../domain/models/models.dart';
import '../sources/transactions_data_source.dart';

part 'transactions_repository.g.dart';

@riverpod
TransactionsRepository transactionsRepository(Ref ref) {
  final datasource = ref.watch(transactionsDataSourceProvider);
  return TransactionsRepositoryImpl(datasource);
}

abstract class TransactionsRepository {
  Future<int> create(Transactions req);
  Future<int> update(int id, Transactions req);
  Future<int> delete(int id);
  Future<List<Transactions>> getAll();
  Future<Transactions?> getById(int id);
  Future<List<Transactions>> getByFilter({
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
  Future<List<Transactions>> getAll() => datasource.getAll();

  @override
  Future<List<Transactions>> getByFilter({
    required TransactionType type,
    DateTime? month,
  }) {
    return datasource.getByFilter(type: type, month: month);
  }

  @override
  Future<Transactions?> getById(int id) => datasource.getById(id);

  @override
  Future<int> update(int id, Transactions req) => datasource.update(id, req);
}
