import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_model.dart';
import 'package:spendit_remake/src/features/financial_goals/domain/models/financial_goal_progress_model.dart';

abstract class FinancialGoalsRepository {
  Future<LocalResponseModel<int>> create(FinancialGoalModel goal);
  Future<LocalResponseModel<List<FinancialGoalModel>>> read();
  Future<LocalResponseModel<int>> update(FinancialGoalModel goal);
  Future<LocalResponseModel<int>> addProgress(FinancialGoalProgressModel progress);
  Future<LocalResponseModel<int>> delete(int id);
}
