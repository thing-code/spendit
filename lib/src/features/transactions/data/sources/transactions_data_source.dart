import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/core.dart';
import '../../domain/models/models.dart';

part 'transactions_data_source.g.dart';

@riverpod
TransactionsDataSource transactionsDataSource(Ref ref) {
  final database = ref.watch(dbProvider.future);
  return TransactionsDataSourceImpl(database);
}

abstract class TransactionsDataSource {
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
  Future<int> update(int id, Transactions req) async {
    final db = await database;

    final data = switch (req) {
      Expense() => req.copyWith(updatedAt: DateTime.now()),
      Income() => req.copyWith(updatedAt: DateTime.now()),
      _ => req,
    };

    final query = db.transaction((txn) async {
      return await txn.update(
        kTransactionTable,
        data.toJson(),
        where: 'id = ?',
        whereArgs: [req.id],
      );
    });
    return query;
  }

  @override
  Future<List<Transactions>> getAll() async {
    final db = await database;
    final query = await db.query(kTransactionTable, orderBy: "created_at DESC");
    final data = query.map((e) => Transactions.fromJson(e)).toList();
    return data;
  }

  @override
  Future<List<Transactions>> getByFilter({
    required TransactionType type,
    DateTime? month,
  }) async {
    final db = await database;
    final (start, end) = (month ?? DateTime.now()).range;
    final query = await db.query(
      kTransactionTable,
      where: 'type = ? AND created_at BETWEEN ? AND ?',
      whereArgs: [type.name, start.toRequest, end.toRequest],
      orderBy: "created_at DESC",
    );
    final data = query.map((e) => Transactions.fromJson(e)).toList();
    return data;
  }

  @override
  Future<Transactions?> getById(int id) async {
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
