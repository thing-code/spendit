import 'package:spendit/src/core/core.dart';

import '../../domain/models/models.dart';

abstract class TransactionDataSource {
  Future<bool> create(Transaction req);
  Future<bool> update(Transaction req);
  Future<bool> delete(int id);
  Future<List<Transaction>> readAll();
  Future<Transaction> readById(int id);
  Future<List<Transaction>> readByFilter({
    required TransactionType type,
    DateTime? startDate,
    DateTime? endDate,
  });
}

class TransactionDataSourceImpl extends TransactionDataSource {
  @override
  Future<bool> create(Transaction req) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Transaction req) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> readByFilter({
    required TransactionType type,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    // TODO: implement readByFilter
    throw UnimplementedError();
  }

  @override
  Future<Transaction> readById(int id) {
    // TODO: implement readById
    throw UnimplementedError();
  }
}
