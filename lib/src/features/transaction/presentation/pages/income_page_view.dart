import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../../../../common/common.dart';
import '../providers/income.dart';

class IncomePageView extends ConsumerWidget {
  const IncomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomes = ref.watch(incomeStateProvider(date: now));
    return COSAsyncWidget(
      asyncValue: incomes,
      onData: (data) {
        if (data.isEmpty) {
          return Center(child: Text('Tidak ada data'));
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            final income = data[index];
            return ListTile(title: Text(income.value.toString()), subtitle: Text(income.type.name));
          },
          separatorBuilder: (context, index) => Gap(12),
          itemCount: data.length,
        );
      },
    );
  }
}
