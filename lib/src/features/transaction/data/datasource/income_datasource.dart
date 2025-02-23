import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';
import 'package:sqflite/sqflite.dart';

part 'income_datasource.g.dart';

@riverpod
IncomeDatasource incomeDataSource(Ref ref) {
  return IncomeDatasource();
}

class IncomeDatasource {
  static final IncomeDatasource _instance = IncomeDatasource._();

  factory IncomeDatasource() => _instance;

  IncomeDatasource._() {
    _init();
  }

  static Database? _database;

  final table = 'income';

  Future<Database> get database async {
    _database ??= await _init();
    return _database!;
  }

  Future<Database> _init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, '$table.db');

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

  Future<int> create(IncomeModel income) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        table,
        income.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<IncomeModel>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => IncomeModel.fromJson(e)).toList();
    return data;
  }

  Future<int> update(IncomeModel income) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        table,
        income.toJson(),
        where: 'id = ?',
        whereArgs: [income.id],
      );
    });
  }

  Future<int> delete(IncomeModel income) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          table,
          where: 'id = ?',
          whereArgs: [income.id],
        );
      },
    );
  }
}
