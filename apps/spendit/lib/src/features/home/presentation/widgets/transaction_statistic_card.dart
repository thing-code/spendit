import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/features/transactions/domain/models/transaction_model.dart';
import 'package:spendit/src/features/transactions/presentation/controllers/transaction_controller.dart';
import 'package:spendit/src/routers/config.routes.dart';
import 'package:spendit_core/spendit_core.dart';

class TransactionStatisticCard extends ConsumerWidget {
  const TransactionStatisticCard(this.transactionType, {super.key});

  final TransactionType transactionType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkResponse(
      onTap: () => TransactionRoute(transactionType).push(context),
      child: SizedBox(
        width: context.deviceWidth,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Icon(icon, color: transactionType.color),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transactionType.label),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          totalTransactions(ref).toDouble().toRupiahCompact,
                          style: SITextStyles.bold.copyWith(fontSize: 18),
                        ),
                        Icon(IconsaxPlusLinear.arrow_right_3, color: SIColors.backgroundGrey),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData get icon {
    switch (transactionType) {
      case TransactionType.income:
        return IconsaxPlusBold.import_1;
      case TransactionType.expense:
        return IconsaxPlusBold.export;
    }
  }

  int totalTransactions(WidgetRef ref) {
    return switch (transactionType) {
      TransactionType.expense => ref.watch(
        transactionControllerProvider.select(
          (value) => (value.value ?? []).whereType<TransactionExpense>().fold(
            0,
            (previousValue, element) => previousValue + element.amount,
          ),
        ),
      ),
      TransactionType.income => ref.watch(
        transactionControllerProvider.select(
          (value) => (value.value ?? []).whereType<TransactionIncome>().fold(
            0,
            (previousValue, element) => previousValue + element.amount,
          ),
        ),
      ),
    };
  }
}
