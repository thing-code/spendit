import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/budgets/domain/models/budget_model.dart';
import 'package:sqflite/sqflite.dart';

part 'budget_data_source.g.dart';

abstract class BudgetDataSource {
  Future<int> create(BudgetModel value);
  Future<List<BudgetModel>> read();
  Future<int> update(BudgetModel value);
}

class BudgetDataSourceImpl implements BudgetDataSource {
  BudgetDataSourceImpl() {
    _initDB();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final db = await getDatabasesPath();
    final path = join(db, SQLiteTable.budgets.db);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(SqlCommand.executeBudgetTable);
      },
    );
  }

  @override
  Future<int> create(BudgetModel value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        SQLiteTable.budgets.name,
        value.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<List<BudgetModel>> read() async {
    final db = await database;
    final response = await db.query(SQLiteTable.budgets.name);
    final data = response.map((e) => BudgetModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<int> update(BudgetModel value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(SQLiteTable.budgets.name, value.toJson(), where: 'id = ?', whereArgs: [value.id]);
    });
  }
}

@riverpod
BudgetDataSource budgetDataSource(Ref ref) {
  return BudgetDataSourceImpl();
}
