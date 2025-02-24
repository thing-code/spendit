import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../common/common.dart';
import '../widgets/balance.dart';
import '../widgets/expense_summary.dart';
import '../widgets/target_form.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 48,
        forceMaterialTransparency: true,
        surfaceTintColor: Colors.transparent,
        title: Text('Hi, ${GreetingUtil.greeting} 🖐️', style: kMediumTextStyle),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [Gap(8), MyBalance(), Gap(24), MonthlyTarget(), ExpenseSummary()],
      ),
    );
  }
}

class MonthlyTarget extends StatelessWidget {
  const MonthlyTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Monthly Target', style: kSemiBoldTextStyle.copyWith(fontSize: 18)),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: TargetType.values.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Gap(8),
            itemBuilder: (context, index) {
              return TargetCard(type: TargetType.values[index], value: 1000000);
            },
          ),
        ),
      ],
    );
  }
}

class TargetCard extends StatelessWidget {
  const TargetCard({super.key, required this.type, required this.value});

  final TargetType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoSheet(context: context, pageBuilder: (context) => TargetForm(type: type));
      },
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 0.96],
              colors: [context.colorScheme.primaryContainer, context.colorScheme.secondary],
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            margin: EdgeInsets.all(2),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 4,
                children: [
                  Icon(type.icon, color: type.color, size: 28),
                  Text(type.label, style: kSemiBoldTextStyle.copyWith(fontSize: 16)),
                  Text(
                    value == 0 ? 'Rp. -' : value.currency,
                    style: kMediumTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
