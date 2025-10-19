import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/core.dart';

part 'forms.g.dart';

@riverpod
TransactionExpenseForm expenseForm(Ref ref) => TransactionExpenseForm();

@riverpod
TransactionIncomeForm incomeForm(Ref ref) => TransactionIncomeForm();

@riverpod
TransactionGoalsForm goalsForm(Ref ref) => TransactionGoalsForm();

class TransactionExpenseForm extends FormGroup {
  TransactionExpenseForm()
    : super({
        'amount': FormControl<int>(),
        'category': FormControl<ExpenseCategory>(
          validators: [RequiredValidator()],
        ),
        'notes': FormControl<String>(),
      });

  FormControl<int> get amount => control('amount') as FormControl<int>;
  FormControl<ExpenseCategory> get category =>
      control('category') as FormControl<ExpenseCategory>;
  FormControl<String> get notes => control('notes') as FormControl<String>;
}

class TransactionIncomeForm extends FormGroup {
  TransactionIncomeForm()
    : super({
        'amount': FormControl<int>(),
        'category': FormControl<IncomeCategory>(
          validators: [RequiredValidator()],
        ),
        'notes': FormControl<String>(),
      });

  FormControl<int> get amount => control('amount') as FormControl<int>;
  FormControl<IncomeCategory> get category =>
      control('category') as FormControl<IncomeCategory>;
  FormControl<String> get notes => control('notes') as FormControl<String>;
}

class TransactionGoalsForm extends FormGroup {
  TransactionGoalsForm() : super({'amount': FormControl<int>()});

  FormControl<int> get amount => control('amount') as FormControl<int>;
}
