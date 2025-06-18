import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/widgets/balance_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/financial_goals_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/header.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_form.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_section.dart';
import 'package:spendit/src/icons/icons.dart';
import 'package:spendit_core/spendit_core.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomSheet(
            context,
            title: 'Tambah Transaksi Baru',
            height: context.deviceHeight * .7,
            builder: (context) => TransactionForm(),
          );
        },
        child: Icon(SpendItIconLinear.arrowLeft, color: SpendItColors.neutralColor),
      ),
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
                  children: [BalanceSection(), TransactionSection()],
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
            SliverPadding(padding: EdgeInsets.all(16), sliver: FinancialGoalsSection()),
          ],
        ),
      ),
    );
  }
}
