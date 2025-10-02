
import '../../../../common/common.dart';
import '../../../transaction/presentation/providers/expense.dart';
import '../../../transaction/presentation/providers/income.dart';

part 'summary.g.dart';

@Riverpod(keepAlive: true)
class TransactionSummaryState extends _$TransactionSummaryState {
  @override
  List<TransactionSummary> build() {
    return List.generate(12, (i) {
      final date = DateTime(now.year, i + 1);
      final income = ref.watch(incomeStateProvider(date: date)).value ?? [];
      final expense = ref.watch(expenseStateProvider(date: date)).value ?? [];
      return TransactionSummary(
        month: i + 1,
        income: income.fold(0, (prev, element) => prev + element.value),
        expense: expense.fold(0, (prev, element) => prev + element.value),
      );
    });
  }

  Future<void> update(DateTime date, TransactionType type) async {
    if (type == TransactionType.income) {
      await _income(date);
    } else {
      await _expense(date);
    }
  }

  Future<void> _income(DateTime date) async {
    final income = await ref.watch(incomeStateProvider(date: date).selectAsync((v) => v));
    state =
        state.map((data) {
          if (income.isNotEmpty &&
              data.month == income.first.date.month &&
              now.year == income.first.date.year) {
            return data.copyWith(income: income.fold(0, (p, e) => p + e.value));
          }
          return data;
        }).toList();
  }

  Future<void> _expense(DateTime date) async {
    final expense = await ref.watch(expenseStateProvider(date: date).selectAsync((v) => v));
    state =
        state.map((data) {
          if (expense.isNotEmpty &&
              data.month == expense.first.date.month &&
              now.year == expense.first.date.year) {
            return data.copyWith(expense: expense.fold(0, (p, e) => p + e.value));
          }
          return data;
        }).toList();
  }
}
