import 'package:path/path.dart';
import 'package:spendit/src/common/common.dart';
import 'package:sqflite/sqflite.dart';

part 'saving_datasource.g.dart';

@riverpod
SavingDatasource savingDatasource(Ref ref) {
  return SavingDatasource();
}

class SavingDatasource {
  static final SavingDatasource _instance = SavingDatasource._();

  factory SavingDatasource() => _instance;

  SavingDatasource._() {
    _init();
  }

  static Database? _database;

  final table = 'saving';

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
        value INTEGER NOT NULL,
        description TEXT,
        date DATE NOT NULL
      )
    ''');
  }

  Future<int> create(Saving saving) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(table, saving.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  Future<List<Saving>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => Saving.fromJson(e)).toList();
    return data;
  }

  Future<List<Saving>> readByMonth(DateTime date) async {
    final db = await database;
    final start = DateTime(date.year, date.month, 1);
    final end = DateTime(date.year, date.month + 1, 0);
    final response = await db.query(
      table,
      where: 'date BETWEEN ? AND ?',
      whereArgs: [start.getPeriod, end.getPeriod],
      orderBy: "date DESC",
    );
    final data = response.map((e) => Saving.fromJson(e)).toList();
    return data;
  }

  Future<int> update(Saving saving) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(table, saving.toJson(), where: 'id = ?', whereArgs: [saving.id]);
    });
  }

  Future<int> delete(Saving saving) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(table, where: 'id = ?', whereArgs: [saving.id]);
    });
  }
}
