import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_remake/src/database/database.dart';
import 'package:spendit_remake/src/features/financial_goals/data/datasources/financial_goals_data_source.dart';
import 'package:spendit_remake/src/features/financial_goals/data/repositories/financial_goals_repository_impl.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/repositories/financial_goals_repository.dart';

part 'financial_goals_provider.g.dart';

@riverpod
FinancialGoalsDataSource financialGoalsDataSource(Ref ref) {
  final db = ref.watch(databaseProvider);
  return FinancialGoalsDataSourceImpl(db);
}

@riverpod
FinancialGoalsRepository financialGoalsRepository(Ref ref) {
  final datasource = ref.watch(financialGoalsDataSourceProvider);
  return FinancialGoalsRepositoryImpl(datasource);
}