import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/controllers/balance_controller.dart';
import 'package:spendit_core/spendit_core.dart';

final showBalance = ValueNotifier(true);

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceControllerProvider.select((value) => value.value ?? 0));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 2,
      children: [
        Text(
          'Saldo Anda',
          style: SiTextStyles.regular.copyWith(fontSize: 16, color: SiColors.text),
        ),
        ValueListenableBuilder(
          valueListenable: showBalance,
          builder: (context, value, child) {
            return Row(
              spacing: 16,
              children: [
                Flexible(
                  child: Text(
                    value ? 'Rp ∙∙∙∙∙∙∙∙∙∙' : balance.toDouble().toRupiah,
                    style: SiTextStyles.bold.copyWith(
                      fontSize: 24,
                      color: SiColors.text,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  onPressed: () => showBalance.value = !showBalance.value,
                  icon: Icon(
                    value ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                    color: SiColors.text,
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
