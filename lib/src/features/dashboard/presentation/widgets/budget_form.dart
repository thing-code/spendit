import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/common/common.dart';

import '../../../../common/widgets/base_cupertino.dart';

class BudgetForm extends HookConsumerWidget {
  const BudgetForm({super.key, required this.type});

  final BudgetType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return BaseCupertinoPage(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Icon(type.icon, color: type.color, size: 32),
            Gap(8),
            Text(DateTime.now().getMonthAndYear, style: kMediumTextStyle.copyWith(fontSize: 20)),
            Text('Budget for ${type.label}', style: kLightTextStyle.copyWith(fontSize: 16)),
            Gap(12),
            TextFieldInput(
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
