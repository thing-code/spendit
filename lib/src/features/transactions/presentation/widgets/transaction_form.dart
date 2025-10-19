import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit/src/features/transactions/domain/forms/forms.dart';

import '../../../../core/core.dart';
import '../../../home/presentation/providers/balance_provider.dart';

Future<bool?> showTransactionForm(BuildContext context) =>
    showCupertinoSheet<bool>(
      context: context,
      builder: (context) => TransactionFormWidget(),
    );

/// Main Transaction Form
class TransactionFormWidget extends ConsumerWidget {
  const TransactionFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);

    return DefaultTabController(
      length: TransactionType.values.length,
      child: Scaffold(
        appBar: SiAppBar(title: Text('New Transaction')),
        body: Column(
          spacing: 16,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                spacing: 4,
                children: [
                  Text(
                    (balance.value ?? 0).currency,
                    style: context.textTheme.headlineSmall,
                  ),
                  Text(
                    'Current Balance',
                    style: TextStyle(color: SiColors.textSecondary),
                  ),
                ],
              ),
            ),
            TabBar(
              labelStyle: context.textTheme.labelSmall,
              tabs: TransactionType.values.map((type) {
                final icon = switch (type) {
                  TransactionType.income => Icon(
                    Amicons.lucide_arrow_down_left,
                  ),
                  TransactionType.expense => Icon(
                    Amicons.lucide_arrow_up_right,
                  ),
                  TransactionType.goals => Icon(Amicons.lucide_goal),
                };
                return Tab(
                  text: type.title,
                  icon: icon,
                  iconMargin: EdgeInsets.all(4),
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TransactionIncomeForm(),
                  TransactionExpenseForm(),
                  TransactionGoalsForm(),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}

/// * Transaction Income Form
class TransactionIncomeForm extends ConsumerWidget {
  const TransactionIncomeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(incomeFormProvider);
    return Scaffold(
      body: ReactiveForm(
        formGroup: form,
        child: Column(
          spacing: 16,
          children: [
            SiCurrencyInput(control: form.amount),
            IncomeCategoryInput(control: form.category, label: 'Category'),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        maintainBottomViewPadding: true,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SiButton.primary(
            onPressed: () {},
            text: 'Add Transaction',
            icon: Icon(Amicons.lucide_plus),
          ),
        ),
      ),
    );
  }
}

class IncomeCategoryInput extends SiBaseInput<IncomeCategory> {
  IncomeCategoryInput({
    super.key,
    required super.control,
    super.label,
    ValueChanged<IncomeCategory?>? onChanged,
  }) : super(
         readOnly: true,
         valueAccessor: IncomeCategoryValueAccessor(),
         suffixIcon: Icon(Amicons.vuesax_arrow_down_1),
         onTap: (ctrl, context) async {
           final selected = await _showOptions(context, control);

           if (selected != null) {
             control.updateValue(selected);
             onChanged?.call(selected);
           }
         },
         inputType: TextInputType.none,
         placeholder: 'Income Category',
       );

  static Future<IncomeCategory?> _showOptions(
    BuildContext context,
    FormControl<IncomeCategory> control,
  ) {
    return SiBottomSheet<IncomeCategory>(context).show(
      showIndicator: true,
      showCloseButton: false,
      title: Text('Select Income Category'),
      builder: (close) {
        return ReactiveValueListenableBuilder(
          formControl: control,
          builder: (context, _, _) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              children: IncomeCategory.values
                  .map(
                    (category) => GestureDetector(
                      onTap: () => close(category),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: control.value == category
                                ? SiColors.secondary
                                : SiColors.grayscale2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          spacing: 8,
                          children: [
                            Text(
                              category.title,
                              style: context.textTheme.bodyLarge,
                            ),
                            if (control.value == category)
                              Icon(
                                Amicons.lucide_check,
                                size: 16,
                                color: SiColors.secondary,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class IncomeCategoryValueAccessor
    extends ControlValueAccessor<IncomeCategory, String> {
  @override
  String? modelToViewValue(IncomeCategory? modelValue) {
    if (modelValue == null) return '';
    return modelValue.title;
  }

  @override
  IncomeCategory? viewToModelValue(String? viewValue) => null;
}

/// * Transaction Expense Form
class TransactionExpenseForm extends ConsumerWidget {
  const TransactionExpenseForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Text('Expense'));
  }
}

/// * Transaction Goals Form
class TransactionGoalsForm extends ConsumerWidget {
  const TransactionGoalsForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: Text('Goals'));
  }
}
