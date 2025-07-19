import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:spendit/src/features/home/presentation/widgets/balance_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/budget_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/financial_goals_section.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_form.dart';
import 'package:spendit/src/features/home/presentation/widgets/transaction_section.dart';
import 'package:spendit/src/gen/assets.gen.dart';
import 'package:spendit_core/spendit_core.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _controller = ScrollController();
  bool _isCollapsed = false;

  void _onScroll() {
    if (_controller.hasClients) {
      final isCollapsed = _controller.offset > 100;
      if (_isCollapsed != isCollapsed) {
        setState(() {
          _isCollapsed = isCollapsed;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

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
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          // SliverAppBar(
          //   centerTitle: true,
          //   titleSpacing: 16,
          //   title: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     spacing: 8,
          //     children: [
          //       Assets.icon.image(height: 32),
          //       Text(
          //         'Spend It',
          //         style: SiTextStyles.semibold.copyWith(fontSize: 20, color: SiColors.text),
          //       ),
          //     ],
          //   ),
          //   flexibleSpace: Container(decoration: BoxDecoration(gradient: SiGradients.darkSurface)),
          // ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.statusBarHeight + context.deviceHeight * .2,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: context.statusBarHeight + context.deviceHeight * .15,
                      padding: EdgeInsets.fromLTRB(16, context.statusBarHeight + 16, 16, 0),
                      decoration: BoxDecoration(
                        gradient: SiGradients.fancyRainbow,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Assets.icon.image(height: 40),
                          Text('Selamat Datang!', style: SiTextStyles.bold.copyWith(fontSize: 24)),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 0,
                    child: Container(
                      height: context.deviceHeight * .094,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: SiColors.surface,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: BalanceSection(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGap(16),
          SliverToBoxAdapter(child: TransactionSection()),
          SliverGap(16),
          SliverToBoxAdapter(child: BudgetSection()),
          SliverGap(16),
          SliverToBoxAdapter(child: Assets.icon.image()),
          SliverGap(16),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Rencana Keuangan', style: SiTextStyles.medium.copyWith(fontSize: 16)),
            ),
          ),
          SliverPadding(padding: EdgeInsets.all(16), sliver: FinancialGoalsSection()),
        ],
      ),
    );
  }
}
