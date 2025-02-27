import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/common/common.dart';

class TransactionForm extends ConsumerWidget {
  const TransactionForm({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return COSCupertinoPage(title: type.label, child: Container());
  }
}
