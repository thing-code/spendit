import 'package:flutter/material.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key, required this.type});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(type.label)));
  }
}
