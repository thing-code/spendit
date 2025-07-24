import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/features/home/presentation/widgets/budget_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/financial_goals_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/header.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_section.dart';
import 'package:spendit_core/spendit_core.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Transaksi Baru'),
        icon: Icon(IconsaxPlusLinear.add, size: 32),
        onPressed: () {
          openBottomSheet(
            context,
            title: 'Tambah Transaksi',
            builder: (close) {
              return Column(children: [Text('Judul')]);
            },
          );
        },
      ),
      body: Column(
        spacing: 16,
        children: [
          Header(),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: TransactionSection()),
                SliverGap(16),
                SliverToBoxAdapter(child: BudgetSection()),
                SliverGap(16),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Rencana Keuangan',
                      style: SiTextStyles.medium.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.all(16), sliver: FinancialGoalsSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
