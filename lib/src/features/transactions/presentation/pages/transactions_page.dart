import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/core/core.dart';

class TransactionsPage extends ConsumerWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SiAppBar(title: Text('Transactions'), canPop: false),
    );
  }
}
