import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit_remake/src/database/database.dart';
import 'package:spendit_remake/src/features/budgets/data/datasources/budget_data_source.dart';
import 'package:spendit_remake/src/features/budgets/data/repositories/budget_repository_impl.dart';
import 'package:spendit_remake/src/features/budgets/domain/repositories/budget_repository.dart';

part 'budget_provider.g.dart';

@riverpod
BudgetDataSource budgetDataSource(Ref ref) {
  final database = ref.watch(databaseProvider);
  return BudgetDataSourceImpl(database);
}

@riverpod
BudgetRepository budgetRepository(Ref ref) {
  final datasource = ref.watch(budgetDataSourceProvider);
  return BudgetRepositoryImpl(datasource);
}