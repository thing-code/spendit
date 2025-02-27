import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../../../common/common.dart';
import '../../../../common/widgets/inputs/datetime_input.dart';

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
        'price': FormControl<String>(value: '', validators: [Validators.required]),
        'description': FormControl<String>(),
        'date': FormControl<DateTime>(value: DateTime.now(), validators: [Validators.required]),
      });

  FormControl<IncomeType> get incomeType => control('income_type') as FormControl<IncomeType>;
  FormControl<BudgetType> get budgetType => control('budget_type') as FormControl<BudgetType>;
  FormControl<String> get price => control('price') as FormControl<String>;
  FormControl<String> get description => control('description') as FormControl<String>;
  FormControl<DateTime> get date => control('date') as FormControl<DateTime>;
}

class TransactionForm extends ConsumerWidget {
  const TransactionForm({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(transactionFgProvider(type));
    return COSCupertinoPage(
      title: type.label,
      onSave: () {
        fg.markAllAsTouched();
        if (fg.valid) {
          switch (type) {
            case TransactionType.expense:
              context.pop((
                null,
                Expense(
                  type: fg.budgetType.value!,
                  value: fg.price.value!.parseThousand,
                  date: fg.date.value!,
                ),
              ));
              break;
            default:
              context.pop((
                Income(
                  type: fg.incomeType.value!,
                  value: fg.price.value!.parseThousand,
                  date: fg.date.value!,
                ),
                null,
              ));
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
                  validationMessages: {ValidationMessage.required: (_) => "Income can't be empty."},
                  prefixIcon: Icon(SolarIconsOutline.archiveDownMinimalistic),
                  itemBuilder:
                      (ctx, i, s) => ListTile(
                        title: Text(i.label),
                        dense: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                ),
              if (type == TransactionType.expense)
                COSDropdownInput(
                  control: fg.budgetType,
                  items: (q) => BudgetType.values,
                  stringify: (i) => i.label,
                  hint: 'Select Expense For',
                  label: 'Expense For',
                  validationMessages: {
                    ValidationMessage.required: (_) => "Expense can't be empty.",
                  },
                  prefixIcon: Icon(SolarIconsOutline.archiveUpMinimalistic),
                  itemBuilder:
                      (ctx, i, s) => ListTile(
                        title: Text(i.label),
                        dense: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                ),
              COSNumberInput(
                control: fg.price,
                hint: 'Price',
                label: 'Price',
                validationMessages: {ValidationMessage.required: (_) => "Price can't be empty."},
                prefixIcon: Icon(SolarIconsOutline.wadOfMoney),
              ),
              COSDateTimeInput(
                control: fg.date,
                label: 'Transaction Date',
                validationMessages: {
                  ValidationMessage.required: (_) => "Transaction Date can't be empty.",
                },
              ),
              COSTextInput(
                control: fg.description,
                hint: 'Description',
                label: 'Description',
                prefixIcon: Icon(SolarIconsOutline.documentText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
