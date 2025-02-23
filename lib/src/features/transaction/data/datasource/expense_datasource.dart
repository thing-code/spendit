import 'package:path/path.dart';
import 'package:spendit/src/common/common.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'expense_datasource.g.dart';

@riverpod
ExpenseDatasource expenseDataSource(Ref ref) {
  return ExpenseDatasource();
}


class ExpenseDatasource {
  static final ExpenseDatasource _instance = ExpenseDatasource._();

  factory ExpenseDatasource() => _instance;

  ExpenseDatasource._() {
    _init();
  }

  static Database? _database;

  final table = 'expense';

  Future<Database> get database async {
    _database ??= await _init();
    return _database!;
  }

  Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'expense.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL,
        value DOUBLE NOT NULL,
        planned DOUBLE,
        diff DOUBLE,
        description TEXT,
        date DATE NOT NULL
      )
    ''');
  }

  Future<int> create(ExpenseModel expense) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        table,
        expense.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<ExpenseModel>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => ExpenseModel.fromJson(e)).toList();
    return data;
  }

  Future<int> update(ExpenseModel expense) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        table,
        expense.toJson(),
        where: 'id = ?',
        whereArgs: [expense.id],
      );
    });
  }

  Future<int> delete(ExpenseModel expense) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          table,
          where: 'id = ?',
          whereArgs: [expense.id],
        );
      },
    );
  }
}
