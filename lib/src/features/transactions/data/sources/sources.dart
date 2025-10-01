import '../../domain/models/models.dart';

abstract class BaseTransactionSource {
  Future<bool> create(Transaction req);
  Future<bool> update(Transaction req);
  Future<bool> delete(String id);
  Future<List<Transaction>> read();
}

class TransactionSource extends BaseTransactionSource {
  @override
  Future<bool> create(Transaction req) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> read() {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<bool> update(Transaction req) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
