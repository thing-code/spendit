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
    return ValueListenableBuilder(
      valueListenable: showBalance,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  Text(
                    'Saldo Anda',
                    style: SiTextStyles.regular.copyWith(fontSize: 16, color: SiColors.mutedText),
                  ),
                  Text(
                    value ? 'Rp ∙∙∙∙∙∙∙∙∙∙' : balance.toDouble().toRupiah,
                    style: SiTextStyles.bold.copyWith(
                      fontSize: 24,
                      color: SiColors.text,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () => showBalance.value = !showBalance.value,
              icon: Icon(
                value ? IconsaxPlusLinear.eye_slash : IconsaxPlusLinear.eye,
                color: SiColors.text,
              ),
            ),
          ],
        );
      },
    );
  }
}
