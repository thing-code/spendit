import 'package:spendit/src/features/dashboard/presentation/providers/balance.dart';

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

    return COSBottomSheetWrapper(
      title: 'Budget Target',
      onSave: () async {
        final control = fg.control('budget') as FormControl<String>;
        control.markAsTouched();
        if (fg.valid) {
          final balance = await ref.read(balanceStateProvider.future);
          if (context.mounted) {
            if (balance - control.value!.parseThousand < 0) {
              COSSnackBar.error(context, message: 'Budget exceeds balance.');
            }
            context.pop();
            await ref
                .read(budgetStateProvider.notifier)
                .edit(budget.copyWith(target: control.value!.parseThousand));
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ReactiveFormBuilder(
          form: () => fg,
          builder: (context, form, _) {
            return Column(
              children: [
                Icon(budget.type.icon, color: budget.type.color, size: 32),
                8.verticalSpace,
                Text(
                  DateTime.now().getMonthAndYear,
                  style: kMediumTextStyle.copyWith(fontSize: 20),
                ),
                Text(
                  'Budget for ${budget.type.label}',
                  style: kLightTextStyle.copyWith(fontSize: 16),
                ),
                12.verticalSpace,
                COSNumberInput(
                  control: form.control('budget') as FormControl<String>,
                  hint: 'Budget',
                  prefixIcon: Icon(SolarIconsOutline.wadOfMoney),
                  validationMessages: {ValidationMessage.required: (_) => "Budget is required."},
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
