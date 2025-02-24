import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';
import 'package:sqflite/sqflite.dart';

part 'budget_datasource.g.dart';

@riverpod
BudgetDatasource budgetDatasource(Ref ref) {
  return BudgetDatasource();
}

class BudgetDatasource {
  static final BudgetDatasource _instance = BudgetDatasource._();

  factory BudgetDatasource() => _instance;

  BudgetDatasource._() {
    _init();
  }

  static Database? _database;

  final table = 'budget';

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
        value DOUBLE NOT NULL
      )
    ''');
  }

  Future<int> create(Budget budget) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(table, budget.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<Budget>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => Budget.fromJson(e)).toList();
    return data;
  }

  Future<int> update(Budget budget) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(table, budget.toJson(), where: 'id = ?', whereArgs: [budget.id]);
    });
  }

  Future<int> delete(Budget budget) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(table, where: 'id = ?', whereArgs: [budget.id]);
    });
  }
}
