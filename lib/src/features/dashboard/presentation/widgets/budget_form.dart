import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/features/dashboard/presentation/providers/budget.dart';

class BudgetForm extends HookConsumerWidget {
  const BudgetForm({super.key, required this.budget, required this.dctx});

  final Budget budget;
  final BuildContext dctx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(
      text: budget.target > 0 ? budget.target.thousand : '',
    );

    return COSCupertinoPage(
      onSave: () async {
        if (controller.text.isEmpty) {
          COSSnackBar.error(dctx, message: 'Budget cannot be empty');
        }
        context.pop();
        await ref
            .read(budgetStateProvider.notifier)
            .edit(budget.copyWith(target: controller.text.parseThousand));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Icon(budget.type.icon, color: budget.type.color, size: 32),
            Gap(8),
            Text(DateTime.now().getMonthAndYear, style: kMediumTextStyle.copyWith(fontSize: 20)),
            Text('Budget for ${budget.type.label}', style: kLightTextStyle.copyWith(fontSize: 16)),
            Gap(12),
            COSTextInput(
              controller: controller,
              hint: 'Budget',
              prefixIcon: Icon(SolarIconsOutline.wadOfMoney),
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly, ThousandFormatter()],
            ),
          ],
        ),
      ),
    );
  }
}
