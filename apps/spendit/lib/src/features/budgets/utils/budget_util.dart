import 'package:flutter/material.dart';
import 'package:native_storage/native_storage.dart';
import 'package:spendit_core/spendit_core.dart';

typedef BudgetUtilCallback = Future<void> Function();

class BudgetUtil {
  final BudgetUtilCallback onReset;

  BudgetUtil({required this.onReset});

  final _storage = NativeStorage();

  final _resetkey = 'budget_reset';

  Future<bool> get _budgetReset async {
    final month = DateTime.now();
    final reset = _storage.read(_resetkey);

    if (reset == null) {
      _storage.write(_resetkey, month.toIso8601String());
    }

    final lastMonth = reset != null ? DateTime.parse(reset) : month;

    final isSameMonth = DateUtils.isSameMonth(month, lastMonth);

    if (isSameMonth) {
      await onReset();

      _storage.write(_resetkey, month.toIso8601String());

      return true;
    }

    return false;
  }

  Future<void> resetBudget(BuildContext context) async {
    if ((await _budgetReset) && context.mounted) {
      Toast.show(context, title: 'Anggaran bulanan telah diatur ulang.');
    }
  }
}
