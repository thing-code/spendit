import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/transactions/domain/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

part 'transaction_data_source.g.dart';

abstract class TransactionDataSource {
  Future<Database> get database;
  Future<int> create(TransactionModel value);
  Future<List<TransactionModel>> read();
  Future<List<TransactionModel>> readAtMonth(DateTime month);
  Future<int> update(TransactionModel value);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  TransactionDataSourceImpl() {
    _initDB();
  }

  static Database? _database;

  Future<Database> _initDB() async {
    final db = await getDatabasesPath();
    final path = join(db, '$transactionTable.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(executeTransactionTable);
      },
    );
  }

  @override
  Future<int> create(TransactionModel value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        transactionTable,
        value.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  @override
  Future<List<TransactionModel>> read() async {
    final db = await database;
    final response = await db.query(transactionTable, orderBy: "date DESC");
    final data = response.map((e) => TransactionModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<int> update(TransactionModel value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        transactionTable,
        value.toJson(),
        where: 'id = ?',
        whereArgs: [value.id],
      );
    });
  }

  @override
  Future<List<TransactionModel>> readAtMonth(DateTime month) async {
    final db = await database;
    final start = month.toStartOfMonth;
    final end = month.toEndOfMonth;
    final response = await db.query(
      transactionTable,
      where: 'date BETWEEN ? AND ?',
      whereArgs: [start.toFormat(), end.toFormat()],
      orderBy: "date DESC",
    );
    final data = response.map((e) => TransactionModel.fromJson(e)).toList();
    return data;
  }
}

@riverpod
TransactionDataSource transactionDataSource(Ref ref) {
  return TransactionDataSourceImpl();
}