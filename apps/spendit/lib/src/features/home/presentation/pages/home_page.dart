import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/features/financial_goals/presentation/widgets/financial_goal_card.dart';
import 'package:spendit/src/features/home/presentation/controllers/balance_controller.dart';
import 'package:spendit/src/features/home/presentation/widgets/budget_statistic_card.dart';
import 'package:spendit/src/features/home/presentation/widgets/header.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_statistic_card.dart';
import 'package:spendit_core/spendit_core.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 72,
              backgroundColor: Colors.transparent,
              pinned: true,
              elevation: 0,
              forceMaterialTransparency: true,
              flexibleSpace: FlexibleSpaceBar(background: Header()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [BalanceSection(), UsageSection()],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Rencana Keuangan',
                  style: SpendItTextStyles.medium.copyWith(fontSize: 16),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverList.separated(
                itemBuilder: (context, index) => FinancialGoalCard(),
                separatorBuilder: (context, index) => Gap(8),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// body: SafeArea(
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       SpendItHeader(),
//       Padding(
//         padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [BalanceSection(), Gap(24), UsageSection()],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Text(
//           'Rencana Keuangan',
//           style: SpendItTextStyles.medium.copyWith(fontSize: 16),
//         ),
//       ),
//       Expanded(
//         child: ListView.separated(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           itemBuilder: (context, index) => FinancialGoalCard(),
//           separatorBuilder: (context, index) => Gap(8),
//           itemCount: 10,
//         ),
//       ),
//     ],
//   ),
// ),

class UsageSection extends ConsumerWidget {
  const UsageSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text('Statistik', style: SpendItTextStyles.regular.copyWith(fontSize: 16)),
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
              Text('Anggaran', style: SpendItTextStyles.regular.copyWith(fontSize: 16)),
              BudgetStatisticCard(),
            ],
          ),
        ),
      ],
    );
  }
}

class BalanceSection extends ConsumerWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceControllerProvider.select((value) => value.value ?? 0));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Saldo Terkini',
          style: SpendItTextStyles.regular.copyWith(
            fontSize: 16,
            color: SpendItColors.primaryColor.shade300,
          ),
        ),
        Text(balance.toDouble().toRupiah, style: SpendItTextStyles.regular.copyWith(fontSize: 24)),
      ],
    );
  }
}
