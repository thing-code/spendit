import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_remake/src/database/database.dart';
import 'package:spendit_remake/src/features/transactions/data/datasources/transaction_data_source.dart';
import 'package:spendit_remake/src/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:spendit_remake/src/features/transactions/domain/repositories/transaction_repository.dart';

part 'transaction_provider.g.dart';

@riverpod
TransactionDataSource transactionDataSource(Ref ref) {
  final db = ref.watch(databaseProvider);
  return TransactionDataSourceImpl(db);
}

@riverpod
TransactionRepository transactionRepository(Ref ref) {
  final datasource = ref.watch(transactionDataSourceProvider);
  return TransactionRepositoryImpl(datasource);
}