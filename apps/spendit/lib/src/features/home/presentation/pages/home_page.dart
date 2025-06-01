import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/features/financial_goals/presentation/widgets/financial_goal_card.dart';
import 'package:spendit_remake/src/features/home/presentation/widgets/budget_statistic_card.dart';
import 'package:spendit_remake/src/features/home/presentation/widgets/header.dart';
import 'package:spendit_remake/src/features/home/presentation/widgets/transaction_statistic_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = 1000000.toDouble().toRupiah;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpendItHeader(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo Terkini', style: SpendItTextStyles.medium.copyWith(fontSize: 16)),
                  Text(balance, style: SpendItTextStyles.bold.copyWith(fontSize: 24)),
                  Gap(24),
                  Row(
                    spacing: 12,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Text(
                              'Statistik',
                              style: SpendItTextStyles.medium.copyWith(fontSize: 16),
                            ),
                            TransactionStatisticCard(TransactionType.income),
                            TransactionStatisticCard(TransactionType.expense),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              'Anggaran',
                              style: SpendItTextStyles.medium.copyWith(fontSize: 16),
                            ),
                            BudgetStatisticCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Rencana Keuangan',
                style: SpendItTextStyles.medium.copyWith(fontSize: 16),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                itemBuilder: (context, index) => FinancialGoalCard(),
                separatorBuilder: (context, index) => Gap(8),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
