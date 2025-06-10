import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/controllers/balance_controller.dart';
import 'package:spendit_core/spendit_core.dart';

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceControllerProvider.select((value) => value.value ?? 0));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saldo Terkini',
          style: SpendItTextStyles.regular.copyWith(
            fontSize: 16,
            color: SpendItColors.primaryColor.shade300,
          ),
        ),
        Text(balance.toDouble().toRupiah, style: SpendItTextStyles.regular.copyWith(fontSize: 24)),
      ],
    );
  }
}