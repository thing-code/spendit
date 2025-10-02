import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:sqflite/sqflite.dart';

part 'transactions_data_source.g.dart';

@riverpod
TransactionsDataSource transactionsDataSource(Ref ref) {
  final database = ref.watch(dbProvider.future);
  return TransactionsDataSourceImpl(database);
}

abstract class TransactionsDataSource {
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

class TransactionsDataSourceImpl extends TransactionsDataSource {
  final Future<Database> database;

  TransactionsDataSourceImpl(this.database);

  @override
  Future<int> create(Transactions req) async {
    final db = await database;
    final query = db.transaction((txn) async {
      return await txn.insert(
        kTransactionTable,
        req.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
    return query;
  }

  @override
  Future<int> delete(int id) async {
    final db = await database;
    final query = db.transaction((txn) async {
      return await txn.delete(
        kTransactionTable,
        where: 'id = ?',
        whereArgs: [id],
      );
    });
    return query;
  }

  @override
  Future<int> update(Transactions req) async {
    final db = await database;
    final query = db.transaction((txn) async {
      return await txn.update(
        kTransactionTable,
        req.toJson(),
        where: 'id = ?',
        whereArgs: [req.id],
      );
    });
    return query;
  }

  @override
  Future<List<Transactions>> readAll() async {
    final db = await database;
    final query = await db.query(kTransactionTable, orderBy: "created_at DESC");
    final data = query.map((e) => Transactions.fromJson(e)).toList();
    return data;
  }

  @override
  Future<List<Transactions>> readByFilter({
    required TransactionType type,
    DateTime? month,
  }) async {
    final db = await database;
    final (start, end) = (month ?? DateTime.now()).range;
    final query = await db.query(
      kTransactionTable,
      where: 'date BETWEEN ? AND ?',
      whereArgs: [start.toRequest, end.toRequest],
      orderBy: "created_at DESC",
    );
    final data = query.map((e) => Transactions.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Transactions?> readById(int id) async {
    final db = await database;
    final query = await db.query(
      kTransactionTable,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
      orderBy: "created_at DESC",
    );
    return query.isNotEmpty ? Transactions.fromJson(query.first) : null;
  }
}
