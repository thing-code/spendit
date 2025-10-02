import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spendit/src/core/core.dart';

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
        'amount': FormControl<int>(validators: [RequiredValidator()]),
        'category': FormControl<ExpenseCategory>(
          validators: [RequiredValidator()],
        ),
        'notes': FormControl<String>(),
      });
}

class TransactionIncomeForm extends FormGroup {
  TransactionIncomeForm()
    : super({
        'amount': FormControl<int>(validators: [RequiredValidator()]),
        'category': FormControl<IncomeCategory>(
          validators: [RequiredValidator()],
        ),
        'notes': FormControl<String>(),
      });
}

class TransactionGoalsForm extends FormGroup {
  TransactionGoalsForm()
    : super({
        'amount': FormControl<int>(validators: [RequiredValidator()]),
      });
}
