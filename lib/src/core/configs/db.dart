import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/constants.dart';

part 'db.g.dart';

@Riverpod(keepAlive: true)
class Db extends _$Db {
  @override
  FutureOr<Database> build() async {
    return openDatabase(
      join(await getDatabasesPath(), 'spendit.db'),
      onCreate: (db, version) {
        db.execute(SqlCommand.executeTransactionTable);
        db.execute(SqlCommand.executeGoalsTable);
        db.execute(SqlCommand.executeGoalsProgressTable);
      },
      version: 2,
    );
  }
}
