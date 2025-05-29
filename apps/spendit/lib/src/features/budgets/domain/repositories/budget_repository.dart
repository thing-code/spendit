import 'package:spendit_core/spendit_core.dart';

import '../models/budget_model.dart';

abstract class BudgetRepository {
  Future<LocalResponseModel<int>> create(BudgetModel value);
  Future<LocalResponseModel<List<BudgetModel>>> read();
  Future<LocalResponseModel<int>> update(BudgetModel value);
}
