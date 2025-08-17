import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction.form.g.dart';

class ExpenseForm extends FormGroup {
  ExpenseForm() : super({'amount': FormControl<int>()});

  FormControl<int> get amount => control('amount') as FormControl<int>;
}

@riverpod
ExpenseForm expenseForm(Ref ref) => ExpenseForm();
