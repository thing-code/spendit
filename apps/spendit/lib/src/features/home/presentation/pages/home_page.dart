import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/widgets/financial_goals_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/header.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_form.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_section.dart';
import 'package:spendit_core/spendit_core.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(IconsaxPlusLinear.add, size: 32),
        onPressed: () {
          openBottomSheet(
            context,
            title: 'Tambah Transaksi Baru',
            height: context.deviceHeight * .5,
            builder: (context) => TransactionForm(),
          );
        },
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            toolbarHeight: 120,
            pinned: true,
            floating: true,
            forceMaterialTransparency: true,
            scrolledUnderElevation: 0,
            flexibleSpace: Header(),
          ),
          SliverToBoxAdapter(child: TransactionSection()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Rencana Keuangan', style: SITextStyles.medium.copyWith(fontSize: 16)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(16), sliver: FinancialGoalsSection()),
        ],
      ),
    );
  }
}
