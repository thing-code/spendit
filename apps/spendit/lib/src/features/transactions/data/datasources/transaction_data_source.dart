import 'package:spendit_core/spendit_core.dart';
import 'package:spendit/src/features/transactions/domain/models/transaction_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class TransactionDataSource {
  Future<int> create(TransactionModel value);
  Future<List<TransactionModel>> read();
  Future<List<TransactionModel>> readByMonth(DateTime month);
  Future<List<TransactionModel>> readByType(TransactionType type);
  Future<int> update(TransactionModel value);
}

class TransactionDataSourceImpl implements TransactionDataSource {
  TransactionDataSourceImpl(this.db);

  final Database db;

  @override
  Future<int> create(TransactionModel value) async {
    return db.insert(
      SQLiteTable.transactions.name,
      value.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<TransactionModel>> read() async {
    final response = await db.query(SQLiteTable.transactions.name, orderBy: "date DESC");
    final data = response.map((e) => TransactionModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<int> update(TransactionModel value) async {
    return db.update(
      SQLiteTable.transactions.name,
      value.toJson(),
      where: 'id = ?',
      whereArgs: [value.id],
    );
  }

  @override
  Future<List<TransactionModel>> readByMonth(DateTime month) async {
    final start = month.toStartOfMonth;
    final end = month.toEndOfMonth;
    final response = await db.query(
      SQLiteTable.transactions.name,
      where: 'date BETWEEN ? AND ?',
      whereArgs: [start.toFormat(), end.toFormat()],
      orderBy: "date DESC",
    );
    final data = response.map((e) => TransactionModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<List<TransactionModel>> readByType(TransactionType type) async {
    final response = await db.query(
      SQLiteTable.transactions.name,
      where: 'type =?',
      whereArgs: [type.name],
      orderBy: "date DESC",
    );
    if (type == TransactionType.expense) {
      final data = response.map((e) => TransactionExpense.fromJson(e)).toList();
      return data;
    }
    final data = response.map((e) => TransactionIncome.fromJson(e)).toList();
    return data;
  }
}
