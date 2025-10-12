import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/core/core.dart';

class BudgetingPage extends ConsumerWidget {
  const BudgetingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: SiAppBar(title: Text('Budgeting'), canPop: false));
  }
}
