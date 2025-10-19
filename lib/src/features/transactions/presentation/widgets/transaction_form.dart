import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:spendit/src/core/core.dart';
import 'package:spendit/src/features/home/presentation/providers/balance_provider.dart';
import 'package:spendit/src/features/transactions/domain/forms/forms.dart';
import 'package:spendit/src/features/transactions/domain/models/models.dart';
import 'package:spendit/src/features/transactions/presentation/providers/transactions_provider.dart';

import 'category_input.dart';

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
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        body: Column(
          spacing: 16,
          children: [
            SiCurrencyInput(control: form.amount),
            IncomeCategoryInput(control: form.category, label: 'Category'),
            SiTextInput(
              control: form.notes,
              label: 'Notes',
              placeholder: 'Your transaction notes',
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          maintainBottomViewPadding: true,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ReactiveFormConsumer(
              builder: (context, formGroup, child) {
                final invalid =
                    form.amount.value == null && form.category.value == null;

                return SiButton.primary(
                  onPressed: invalid
                      ? null
                      : () async {
                          final req = TxnIncome(
                            amount: form.amount.value ?? 0,
                            category: form.category.value!,
                            notes: form.notes.value,
                            createdAt: DateTime.now(),
                          );
                          await ref
                              .read(transactionProvider.notifier)
                              .createTransaction(req);
                          if (context.mounted) {
                            context.pop();
                          }
                        },
                  text: 'Add Transaction',
                  icon: Icon(Amicons.lucide_plus),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
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
