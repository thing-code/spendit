import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../common/common.dart';
import '../providers/budget.dart';

class BudgetForm extends ConsumerWidget {
  const BudgetForm({super.key, required this.budget, required this.dctx});

  final Budget budget;
  final BuildContext dctx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = FormGroup({
      'budget': FormControl<String>(
        value: budget.target > 0 ? budget.target.thousand : '',
        validators: [Validators.required],
      ),
    });

    return COSCupertinoPage(
      title: 'Budget Target',
      onSave: () async {
        final control = fg.control('budget') as FormControl<String>;
        if (control.value == null || control.value == '') return;
        context.pop();
        await ref
            .read(budgetStateProvider.notifier)
            .edit(budget.copyWith(target: control.value!.parseThousand));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ReactiveFormBuilder(
          form: () => fg,
          builder: (context, form, _) {
            return Column(
              children: [
                Icon(budget.type.icon, color: budget.type.color, size: 32),
                Gap(8),
                Text(
                  DateTime.now().getMonthAndYear,
                  style: kMediumTextStyle.copyWith(fontSize: 20),
                ),
                Text(
                  'Budget for ${budget.type.label}',
                  style: kLightTextStyle.copyWith(fontSize: 16),
                ),
                Gap(12),
                COSTextInput(
                  control: form.control('budget') as FormControl<String>,
                  hint: 'Budget',
                  prefixIcon: Icon(SolarIconsOutline.wadOfMoney),
                  keyboardType: TextInputType.numberWithOptions(),
                  validationMessages: {ValidationMessage.required: (_) => "Budget can't be empty."},
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, ThousandFormatter()],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
