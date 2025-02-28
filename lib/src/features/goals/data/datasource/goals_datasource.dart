import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../common/common.dart';

part 'goals_datasource.g.dart';

@riverpod
GoalsDatasource goalsDatasource(Ref ref) {
  return GoalsDatasource();
}

class GoalsDatasource {
  GoalsDatasource() {
    _init();
  }

  static Database? _database;

  final table = 'goals';

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
        name TEXT NOT NULL,
        target INTEGER NOT NULL,
        progress INTEGER NOT NULL,
        deadline DATE NOT NULL
      )
    ''');
  }

  Future<int> create(Goals goals) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(table, goals.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<Goals>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => Goals.fromJson(e)).toList();
    return data;
  }

  Future<int> update(Goals goals) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(table, goals.toJson(), where: 'id = ?', whereArgs: [goals.id]);
    });
  }

  Future<int> delete(Goals goals) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(table, where: 'id = ?', whereArgs: [goals.id]);
    });
  }
}
