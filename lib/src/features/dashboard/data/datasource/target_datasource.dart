import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/common/common.dart';
import 'package:sqflite/sqflite.dart';

part 'target_datasource.g.dart';

@riverpod
TargetDatasource targetDatasource(Ref ref) {
  return TargetDatasource();
}

class TargetDatasource {
  static final TargetDatasource _instance = TargetDatasource._();

  factory TargetDatasource() => _instance;

  TargetDatasource._() {
    _init();
  }

  static Database? _database;

  final table = 'monthly_target';

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

  Future<int> create(MonthlyTarget target) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(table, target.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<MonthlyTarget>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => MonthlyTarget.fromJson(e)).toList();
    return data;
  }

  Future<int> update(MonthlyTarget target) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(table, target.toJson(), where: 'id = ?', whereArgs: [target.id]);
    });
  }

  Future<int> delete(MonthlyTarget target) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(table, where: 'id = ?', whereArgs: [target.id]);
    });
  }
}
