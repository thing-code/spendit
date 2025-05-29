import 'package:path/path.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/budgets/domain/models/budget_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'budget_datasource.g.dart';

abstract class BudgetDatasource {
  Future<Database> initDB();
  Future<Database> get database;
  Future<int> create(BudgetModel value);
  Future<List<BudgetModel>> read();
  Future<int> update(BudgetModel value);
}

class BudgetDatasourceImpl implements BudgetDatasource {
  BudgetDatasourceImpl() {
    initDB();
  }

  static Database? _database;

  @override
  Future<Database> get database async {
    _database ??= await initDB();
    return _database!;
  }

  @override
  Future<Database> initDB() async {
    final db = await getDatabasesPath();
    final path = join(db, '$budgetTable.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(executeBudgetTable);
      },
    );
  }

  @override
  Future<int> create(BudgetModel value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        budgetTable,
        value.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  @override
  Future<List<BudgetModel>> read() async {
    final db = await database;
    final response = await db.query(budgetTable);
    final data = response.map((e) => BudgetModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<int> update(BudgetModel value) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(budgetTable, value.toJson(), where: 'id = ?', whereArgs: [value.id]);
    });
  }
}

@riverpod
BudgetDatasource budgetDatasource(Ref ref) {
  return BudgetDatasourceImpl();
}