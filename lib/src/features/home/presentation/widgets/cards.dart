import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/core.dart';
import '../../../transactions/domain/models/models.dart';
import '../providers/balance_provider.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});

  final Transactions transaction;

  @override
  Widget build(BuildContext context) {
    final name = switch (transaction) {
      TxnExpense(:var notes, :var category) => notes ?? category.title,
      TxnIncome(:var notes, :var category) => notes ?? category.title,
      TxnGoals(:var type) => type.title,
    };

    final operation = switch (transaction) {
      TxnExpense() => Icon(Amicons.lucide_minus, size: 12),
      TxnIncome() => Icon(Amicons.lucide_plus, size: 12),
      TxnGoals() => null,
    };

    final icon = switch (transaction) {
      TxnExpense(:var category) => _expenseIcon(category),
      TxnIncome(:var category) => _incomeIcon(category),
      TxnGoals() => Icon(Amicons.lucide_goal),
    };

    return Card(
      child: InkResponse(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(12),
          child: IntrinsicHeight(
            child: Row(
              spacing: 12,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: SiColors.primaryContainer,
                  ),
                  child: icon,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction.createdAt.cardDate,
                        style: TextStyle(color: SiColors.textSecondary),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 6,
                  children: [
                    ?operation,
                    Text(
                      transaction.amount.currency,
                      style: TextStyle(fontWeight: FontWeight.w600, height: 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Icon _incomeIcon(IncomeCategory category) {
    return switch (category) {
      IncomeCategory.salary => Icon(Amicons.vuesax_wallet_1),
      IncomeCategory.investment => Icon(Amicons.vuesax_diagram),
      IncomeCategory.freelance => Icon(Amicons.lucide_briefcase_business),
    };
  }

  Icon _expenseIcon(ExpenseCategory category) {
    return switch (category) {
      ExpenseCategory.bill => Icon(Amicons.vuesax_receipt_item),
      ExpenseCategory.family => Icon(Amicons.vuesax_house),
      ExpenseCategory.food => Icon(Amicons.lucide_ham),
      ExpenseCategory.health => Icon(Amicons.vuesax_health),
      ExpenseCategory.other => Icon(Amicons.vuesax_more),
      ExpenseCategory.reward => Icon(Amicons.vuesax_gift),
      ExpenseCategory.shopping => Icon(Amicons.vuesax_shopping_cart),
      ExpenseCategory.transport => Icon(Amicons.vuesax_truck_fast),
    };
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkResponse(
        onTap: () {},
        child: Container(
          width: context.screenSize.width * .85,
          padding: const EdgeInsets.all(12.0),
          child: IntrinsicHeight(
            child: Row(
              spacing: 12,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: SiColors.secondaryContainer,
                  ),
                  child: Icon(Amicons.vuesax_like, color: SiColors.secondary),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vespa Matic',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: SiColors.grayscale1,
                              border: Border.all(color: SiColors.grayscale2),
                            ),
                            child: Text('50%', style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Rp. 16.000.000',
                              style: TextStyle(color: SiColors.textSecondary),
                            ),
                            TextSpan(text: ' / '),
                            TextSpan(
                              text: 'Rp. 32.000.000',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: SiColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionTypeCard extends ConsumerWidget {
  const TransactionTypeCard(this.type, {super.key});

  final TransactionType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalIncome = ref.watch(totalIncomeProvider);
    final totalExpense = ref.watch(totalExpenseProvider);
    final visible = ref.watch(transactionVisibilityProvider);

    final background = switch (type) {
      TransactionType.income => SiColors.primaryContainer,
      TransactionType.expense => SiColors.secondaryContainer,
      _ => SiColors.surface,
    };

    final color = switch (type) {
      TransactionType.income => SiColors.primary,
      TransactionType.expense => SiColors.secondary,
      _ => SiColors.primary,
    };

    final textColor = switch (type) {
      TransactionType.income => SiColors.textPrimary,
      TransactionType.expense => SiColors.secondaryContainer,
      _ => SiColors.textPrimary,
    };

    final icon = switch (type) {
      TransactionType.income => Icon(
        Amicons.lucide_arrow_down_left,
        color: context.colorScheme.primary,
        size: 16,
      ),
      TransactionType.expense => Icon(
        Amicons.lucide_arrow_up_right,
        color: context.colorScheme.secondary,
        size: 16,
      ),
      _ => Icon(
        Amicons.vuesax_wallet_1,
        color: context.colorScheme.onPrimary,
        size: 16,
      ),
    };

    final amount = switch (type) {
      TransactionType.income => totalIncome.value ?? 0,
      TransactionType.expense => totalExpense.value ?? 0,
      _ => 0,
    };

    final name = switch (type) {
      TransactionType.income => 'Income',
      TransactionType.expense => 'Expense',
      _ => 'Goals',
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
        border: Border.all(color: SiColors.grayscale1),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: icon,
              ),
            ],
          ),
          Text(
            visible ? amount.currency : kHiddenAmount,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
