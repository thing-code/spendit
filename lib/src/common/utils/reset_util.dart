import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_storage/native_storage.dart';

import '../../features/dashboard/presentation/providers/budget.dart';
import 'snackbar_util.dart';

class COSResetUtil {
  final WidgetRef ref;

  final _storage = NativeStorage();

  final _lastResetKey = 'last_reset';

  COSResetUtil(this.ref);

  Future<bool> checkAndResetIfNeeded() async {
    final now = DateTime.now();
    final lastReset = _storage.read(_lastResetKey);
    debugPrint('LastReset: $lastReset');
    if (lastReset == null) {
      _storage.write(_lastResetKey, now.toIso8601String());
    }
    final lastResetDate = lastReset != null ? DateTime.parse(lastReset) : now;

    final needReset = (now.month != lastResetDate.month) || (now.year != lastResetDate.year);

    debugPrint('NeedReset: $needReset');
    if (needReset) {
      await reset();

      _storage.write(_lastResetKey, now.toIso8601String());

      return true;
    }

    return false;
  }

  Future<void> reset() async {
    // Reset Monthly Budget
    await ref.read(budgetStateProvider.notifier).monthlyReset();
  }

  Future<void> monthlyReset() async {
    bool wasReset = await checkAndResetIfNeeded();

    if (wasReset) {
      final snackbar = COSSnackBar();
      snackbar.success(message: 'Monthly reset successful');
    }
  }
}
