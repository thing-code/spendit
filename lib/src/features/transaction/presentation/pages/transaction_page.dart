import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/features/transaction/presentation/pages/expense_page_view.dart';
import 'package:spendit/src/features/transaction/presentation/pages/income_page_view.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: COSAppBar(title: 'Transactions', centerTitle: true),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: COSTabBar(
                controller: _controller,
                tabs: [
                  COSTabItem(title: 'Income', icon: SolarIconsBold.archiveDownMinimalistic),
                  COSTabItem(title: 'Expense', icon: SolarIconsBold.archiveUpMinimalistic),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [IncomePageView(), ExpensePageView()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
