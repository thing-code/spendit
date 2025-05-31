import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:sqflite/sqflite.dart';

part 'database.g.dart';

@riverpod
Database database(Ref ref) => throw UnimplementedError();

Future<Database> initDatabase() async {
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