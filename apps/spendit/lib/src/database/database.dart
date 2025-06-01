import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

@riverpod
Database database(Ref ref) => throw UnimplementedError();

abstract final class SQLiteDatabaseUtils {
  static Future<Database> initDatabase() async {
    final db = await getDatabasesPath();
    final path = join(db, 'spendit.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(SqlCommand.executeBudgetTable);
        await db.execute(SqlCommand.executeTransactionTable);
        await db.execute(SqlCommand.executeGoalsTable);
        await db.execute(SqlCommand.executeGoalsProgressTable);
        // Todo: Tambahkan execute jika ada tabel baru.
      },
    );
  }

  static Future<List<String>> getTableNames(Database db) async {
    List<Map<String, dynamic>> tables = await db.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' AND name NOT LIKE 'android_metadata';",
    );
    return tables.map((row) => row['name'] as String).toList();
  }
}
