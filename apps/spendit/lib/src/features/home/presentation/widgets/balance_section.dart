import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/controllers/balance_controller.dart';
import 'package:spendit_core/spendit_core.dart';

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceControllerProvider.select((value) => value.value ?? 0));
    var showBalance = ValueNotifier(true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Saldo Anda',
          style: SITextStyles.regular.copyWith(fontSize: 16, color: SIColors.backgroundWhite),
        ),
        ValueListenableBuilder(
          valueListenable: showBalance,
          builder: (context, value, child) {
            return Row(
              spacing: 16,
              children: [
                Flexible(
                  child: Text(
                    value ? 'Rp ******' : balance.toDouble().toRupiah,
                    style: SITextStyles.medium.copyWith(
                      fontSize: 24,
                      color: SIColors.backgroundWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () => showBalance.value = !showBalance.value,
                  child: Icon(
                    value ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                    color: SIColors.backgroundWhite,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
