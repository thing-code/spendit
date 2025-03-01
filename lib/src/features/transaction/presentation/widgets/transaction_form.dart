import '../../../../common/common.dart';
import '../../../../common/widgets/inputs/datetime_input.dart';
import '../../../dashboard/data/repository/budget_repository_impl.dart';

part 'transaction_form.g.dart';

@riverpod
TransactionFormGroup transactionFg(Ref ref, TransactionType type) {
  return TransactionFormGroup(type);
}

class TransactionFormGroup extends FormGroup {
  final TransactionType type;
  TransactionFormGroup(this.type)
    : super({
        'income_type': FormControl<IncomeType>(
          validators: [if (type == TransactionType.income) Validators.required],
        ),
        'budget_type': FormControl<BudgetType>(
          validators: [if (type == TransactionType.expense) Validators.required],
        ),
        'spend': FormControl<String>(value: '', validators: [Validators.required]),
        'description': FormControl<String>(),
        'date': FormControl<DateTime>(value: DateTime.now(), validators: [Validators.required]),
      });

  FormControl<IncomeType> get incomeType => control('income_type') as FormControl<IncomeType>;
  FormControl<BudgetType> get budgetType => control('budget_type') as FormControl<BudgetType>;
  FormControl<String> get spend => control('spend') as FormControl<String>;
  FormControl<String> get description => control('description') as FormControl<String>;
  FormControl<DateTime> get date => control('date') as FormControl<DateTime>;
}

class TransactionForm extends ConsumerWidget {
  const TransactionForm({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(transactionFgProvider(type));
    return COSBottomSheetWrapper(
      title: type.label,
      onSave: () async {
        fg.markAllAsTouched();
        if (fg.valid) {
          switch (type) {
            case TransactionType.expense:
              final checked = await _check(context, ref, fg);
              if (checked && context.mounted) _expense(context, fg);
              break;
            default:
              _income(context, fg);
          }
        }
      },
      child: ReactiveForm(
        formGroup: fg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              if (type == TransactionType.income)
                COSDropdownInput(
                  control: fg.incomeType,
                  items: (q) => IncomeType.values,
                  stringify: (i) => i.label,
                  hint: 'Select Income From',
                  label: 'Income From',
                  validationMessages: {ValidationMessage.required: (_) => "Income is required."},
                  prefixIcon: Icon(SolarIconsOutline.archiveDownMinimalistic),
                  itemBuilder:
                      (ctx, i, s) =>
                          COSListTile.dropdown(title: i.label, selected: s, icon: i.icon),
                ),
              if (type == TransactionType.expense)
                COSDropdownInput(
                  control: fg.budgetType,
                  items: (q) => BudgetType.values,
                  stringify: (i) => i.label,
                  hint: 'Select Expense For',
                  label: 'Expense For',
                  validationMessages: {ValidationMessage.required: (_) => "Expense is required."},
                  prefixIcon: Icon(SolarIconsOutline.archiveUpMinimalistic),
                  itemBuilder:
                      (ctx, i, s) =>
                          COSListTile.dropdown(title: i.label, selected: s, icon: i.icon),
                ),
              COSNumberInput(
                control: fg.spend,
                hint: 'Price',
                label: 'Price',
                validationMessages: {ValidationMessage.required: (_) => "Price is required."},
                prefixIcon: Icon(SolarIconsOutline.wadOfMoney),
              ),
              COSDateTimeInput(
                control: fg.date,
                label: 'Transaction Date',
                validationMessages: {
                  ValidationMessage.required: (_) => "Transaction date is required.",
                },
              ),
              ReactiveValueListenableBuilder(
                formControl: fg.budgetType,
                builder: (context, control, _) {
                  if (type.isExpense &&
                      fg.budgetType.value != null &&
                      fg.budgetType.value!.isOthers) {
                    fg.description.setValidators([Validators.required]);
                  }
                  return COSTextInput(
                    control: fg.description,
                    hint: 'Description',
                    label: 'Description',
                    validationMessages: {
                      ValidationMessage.required: (_) => "Description is required.",
                    },
                    prefixIcon: Icon(SolarIconsOutline.documentText),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _income(BuildContext context, TransactionFormGroup fg) {
    context.pop((
      Income(
        type: fg.incomeType.value!,
        value: fg.spend.value!.parseThousand,
        date: fg.date.value!,
      ),
      null,
      fg.date.value,
    ));
  }

  void _expense(BuildContext context, TransactionFormGroup fg) {
    context.pop((
      null,
      Expense(
        type: fg.budgetType.value!,
        value: fg.spend.value!.parseThousand,
        date: fg.date.value!,
      ),
      fg.date.value,
    ));
  }

  Future<bool> _check(BuildContext context, WidgetRef ref, TransactionFormGroup fg) async {
    final budget = await ref.read(budgetRepositoryProvider).single(fg.budgetType.value!);
    if (budget.budget != null) {
      final isOverSpending =
          (budget.budget!.value + fg.spend.value!.parseThousand) > budget.budget!.target;
      final targetNotSet = budget.budget!.target == 0;
      if (targetNotSet && context.mounted) {
        COSSnackBar.error(
          context,
          message: 'Spending target for ${fg.budgetType.value!.name} not set.',
        );
        return false;
      }
      if (isOverSpending && context.mounted) {
        COSSnackBar.error(
          context,
          message: 'Spending on the ${fg.budgetType.value!.name} exceeds the target.',
        );
        return false;
      }
    }
    return true;
  }
}
