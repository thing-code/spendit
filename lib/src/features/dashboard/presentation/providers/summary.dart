import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/common.dart';
import '../../../transaction/presentation/providers/expense.dart';
import '../../../transaction/presentation/providers/income.dart';

part 'summary.g.dart';

@riverpod
FutureOr<List<TransactionSummary>> summaries(Ref ref) async {
  List<TransactionSummary> result = [];
  for (var i = 1; i < 13; i++) {
    final date = DateTime(now.year, i);
    final income = await ref.read(incomeStateProvider(date: date).future);
    final expense = await ref.read(expenseStateProvider(date: date).future);
    result.add(
      TransactionSummary(
        month: i,
        income: income.fold(0, (prev, element) => prev + element.value),
        expense: expense.fold(0, (prev, element) => prev + element.value),
      ),
    );
  }
  return result;
}
