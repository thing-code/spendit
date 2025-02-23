import 'package:path/path.dart';
import 'package:spendit/src/common/common.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'saving_datasource.g.dart';

@riverpod
SavingDatasource savingDataSource(Ref ref) {
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
        value DOUBLE NOT NULL,
        description TEXT,
        date DATE NOT NULL
      )
    ''');
  }

  Future<int> create(SavingModel saving) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        table,
        saving.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<SavingModel>> read() async {
    final db = await database;
    final response = await db.query(table, orderBy: "date DESC");
    final data = response.map((e) => SavingModel.fromJson(e)).toList();
    return data;
  }

  Future<int> update(SavingModel saving) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        table,
        saving.toJson(),
        where: 'id = ?',
        whereArgs: [saving.id],
      );
    });
  }

  Future<int> delete(SavingModel saving) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          table,
          where: 'id = ?',
          whereArgs: [saving.id],
        );
      },
    );
  }
}