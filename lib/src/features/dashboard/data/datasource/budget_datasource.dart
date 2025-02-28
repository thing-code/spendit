import 'package:path/path.dart';
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
        value INTEGER NOT NULL,
        target INTEGER NOT NULL
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
    final response = await db.query(table);
    final data = response.map((e) => Budget.fromJson(e)).toList();
    return data;
  }

  Future<Budget> single(BudgetType type) async {
    final db = await database;
    final response = await db.query(table, where: 'type = ?', whereArgs: [type.name]);
    if (response.isNotEmpty) {
      return Budget.fromJson(response.last);
    } else {
      throw Exception('Budget not found');
    }
  }

  Future<int> update(Budget budget) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(table, budget.toJson(), where: 'id = ?', whereArgs: [budget.id]);
    });
  }
}
