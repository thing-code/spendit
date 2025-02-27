import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/common/widgets/inputs/datetime_input.dart';

part 'transaction_form.g.dart';

@riverpod
TransactionFormGroup transactionFg(Ref ref) {
  return TransactionFormGroup();
}

class TransactionFormGroup extends FormGroup {
  TransactionFormGroup()
    : super({
        'income_type': FormControl<IncomeType>(),
        'budget_type': FormControl<BudgetType>(),
        'price': FormControl<String>(value: '', validators: [Validators.required]),
        'date': FormControl<DateTime>(value: DateTime.now(), validators: [Validators.required]),
      });

  FormControl<IncomeType> get incomeType => control('income_type') as FormControl<IncomeType>;
  FormControl<BudgetType> get budgetType => control('budget_type') as FormControl<BudgetType>;
  FormControl<String> get price => control('price') as FormControl<String>;
  FormControl<DateTime> get date => control('date') as FormControl<DateTime>;
}

class TransactionForm extends ConsumerWidget {
  const TransactionForm({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fg = ref.watch(transactionFgProvider);
    return COSCupertinoPage(
      title: type.label,
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
                  hint: 'Income Type',
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
                  hint: 'Expense Type',
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
                prefixIcon: Icon(SolarIconsOutline.wadOfMoney),
              ),
              COSDateTimeInput(control: fg.date),
            ],
          ),
        ),
      ),
    );
  }
}
