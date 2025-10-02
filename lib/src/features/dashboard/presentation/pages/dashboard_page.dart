import '../../../../common/common.dart';
import '../../../transaction/presentation/providers/expense.dart';
import '../../../transaction/presentation/providers/income.dart';
import '../providers/budget.dart';
import '../providers/summary.dart';
import '../widgets/balance.dart';
import '../widgets/monthly_budget.dart';
import '../widgets/transaction_summary.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    Future.microtask(() async {
      await _reset();
      final budgets = await ref.read(budgetStateProvider.future);
      if (budgets.isEmpty) await ref.read(budgetStateProvider.notifier).init();
    });
    super.initState();
  }

  Future<void> _reset() async {
    final resetUtil = COSResetUtil(ref);
    await resetUtil.monthlyReset(context);
  }

  Future<void> _onRefresh() async {
    ref.invalidate(incomeStateProvider(date: now));
    ref.invalidate(expenseStateProvider(date: now));
    ref.invalidate(transactionSummaryStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: COSAppBarAlt(),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: COSBalance()),
            SliverToBoxAdapter(child: COSTransactionSummary()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text('Budgets', style: kSemiBoldTextStyle.copyWith(fontSize: 18.sp)),
              ),
            ),
            SliverPadding(padding: EdgeInsets.all(16.w), sliver: COSMonthlyBudget()),
          ],
        ),
      ),
    );
  }
}
