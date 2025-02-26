import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/common.dart';
import '../../data/repository/income_repository_impl.dart';

part 'income.g.dart';

@Riverpod(keepAlive: true)
class IncomeState extends _$IncomeState {
  @override
  FutureOr<List<Income>> build({DateTime? date}) async {
    if (date != null) {
      final incomes = await ref.read(incomeRepositoryProvider).readByMonth(date);
      return incomes.fold((l) => [], (r) => r);
    }
    final incomes = await ref.read(incomeRepositoryProvider).read();
    return incomes.fold((l) => [], (r) => r);
  }

  Future<bool> add(Income income) async {
    final result = await ref.read(incomeRepositoryProvider).create(income);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> edit(Income income) async {
    final result = await ref.read(incomeRepositoryProvider).update(income);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> delete(Income income) async {
    final result = await ref.read(incomeRepositoryProvider).delete(income);
    ref.invalidateSelf();
    return result.fold((l) => false, (r) => true);
  }
}
