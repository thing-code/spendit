import 'package:spendit/src/features/budgets/data/datasources/budget_data_source.dart';
import 'package:spendit/src/features/budgets/domain/models/budget_model.dart';
import 'package:spendit/src/features/budgets/domain/repositories/budget_repository.dart';
import 'package:spendit_core/spendit_core.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetDataSource datasource;
  BudgetRepositoryImpl(this.datasource);

  @override
  Future<LocalResponseModel<int>> create(BudgetModel value) async {
    try {
      final result = await datasource.create(value);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<List<BudgetModel>>> read() async {
    try {
      final result = await datasource.read();
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }

  @override
  Future<LocalResponseModel<int>> update(BudgetModel value) async {
    try {
      final result = await datasource.update(value);
      return LocalResponseSuccess(result);
    } catch (e) {
      return LocalResponseFailure(e.toString());
    }
  }
}
