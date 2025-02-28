import 'package:spendit/src/common/common.dart';

class COSTabBar extends StatelessWidget {
  const COSTabBar({super.key, this.controller, required this.tabs});

  final TabController? controller;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.colorScheme.primaryContainer.withValues(alpha: .5),
      ),
      child: TabBar(
        controller: controller,
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: context.colorScheme.primary,
        tabs: tabs,
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [Text(title, style: kMediumTextStyle), Icon(icon, size: 20)],
      ),
    );
  }
}