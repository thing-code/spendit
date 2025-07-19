import 'package:spendit/src/features/budgets/domain/models/budget_model.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:sqflite/sqflite.dart';

abstract class BudgetDataSource {
  Future<int> create(BudgetModel value);
  Future<List<BudgetModel>> read();
  Future<int> update(BudgetModel value);
}

class BudgetDataSourceImpl implements BudgetDataSource {
  final Database db;

  BudgetDataSourceImpl(this.db);

  @override
  Future<int> create(BudgetModel value) async {
    return db.insert(
      SQLiteTable.budgets.name,
      value.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<BudgetModel>> read() async {
    final response = await db.query(SQLiteTable.budgets.name);
    final data = response.map((e) => BudgetModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<int> update(BudgetModel value) async {
    return db.update(
      SQLiteTable.budgets.name,
      value.toJson(),
      where: 'id = ?',
      whereArgs: [value.id],
    );
  }
}
