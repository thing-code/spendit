import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/home/presentation/widgets/balance_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/financial_goals_section.dart';
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
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Transaksi Baru'),
        icon: Icon(IconsaxPlusLinear.add, size: 32),
        onPressed: () {
          openBottomSheet(
            context,
            title: 'Tambah Transaksi Baru',
            // showCloseIcon: true,
            height: context.deviceHeight * .5,
            builder: (context) => TransactionForm(),
          );
        },
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
            expandedHeight: 100 + context.statusBarHeight,
            centerTitle: false,
            titleSpacing: 16,
            title: Text(
              'Selamat Datang',
              style: SITextStyles.semibold.copyWith(fontSize: 20, color: SIColors.backgroundWhite),
            ),
            floating: true,
            pinned: true,
            flexibleSpace: DecoratedBox(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: RadialGradient(
                  colors: [SIColors.secondary, SIColors.primary],
                  center: Alignment.bottomRight,
                  radius: 1.5,
                ),
              ),
              child: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.fromLTRB(16, context.statusBarHeight * 2, 16, 16),
                  child: BalanceSection(),
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: 120 + context.statusBarHeight,
          //     padding: EdgeInsets.fromLTRB(16, context.statusBarHeight, 16, 16),
          //     width: context.deviceWidth,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          //       gradient: RadialGradient(
          //         colors: [SIColors.secondary, SIColors.primary],
          //         center: Alignment.bottomRight,
          //         radius: 1.5,
          //       ),
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       spacing: 16,
          //       children: [
          //         Text(
          //           'Selamat Datang',
          //           style: SITextStyles.semibold.copyWith(
          //             fontSize: 20,
          //             color: SIColors.backgroundWhite,
          //           ),
          //         ),
          //         BalanceSection(),
          //       ],
          //     ),
          //   ),
          // ),
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
