import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../common/common.dart';

class FundsDatasource {
  FundsDatasource() {
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
        deadline DATE NOT NULL,
        FOREIGN KEY (tabunganId) REFERENCES tabungan (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> create(Funds value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(table, value.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<Funds>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "deadline DESC");
    final data = response.map((e) => Funds.fromJson(e)).toList();
    return data;
  }

  Future<int> update(Funds value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(table, value.toJson(), where: 'id = ?', whereArgs: [value.id]);
    });
  }

  Future<int> delete(Funds value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(table, where: 'id = ?', whereArgs: [value.id]);
    });
  }
}
