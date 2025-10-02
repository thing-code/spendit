import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../common/common.dart';

part 'funds_datasource.g.dart';

@riverpod
FundsDatasource fundsDatasource(Ref ref) {
  return FundsDatasource();
}

class FundsDatasource {
  FundsDatasource() {
    _init();
  }

  static Database? _database;

  final table = 'funds';

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
        goals_id INTEGER NOT NULL,
        value INTEGER NOT NULL,
        date DATETIME NOT NULL,
        FOREIGN KEY (goals_id) REFERENCES goals (id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> create(Funds value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(table, value.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<Funds>> read(int id) async {
    final db = await database;
    final response = await db.query(
      table,
      where: 'goals_id = ?',
      whereArgs: [id],
      orderBy: "date DESC",
    );
    final data = response.map((e) => Funds.fromJson(e)).toList();
    return data;
  }
}
