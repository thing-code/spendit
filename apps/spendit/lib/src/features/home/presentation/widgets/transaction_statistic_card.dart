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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, color: transactionType.color),
                    Icon(IconsaxPlusLinear.arrow_right_3, color: SiColors.mutedText),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2,
                  children: [
                    Text(
                      transactionType.label,
                      style: SiTextStyles.regular.copyWith(fontSize: 16, color: SiColors.mutedText),
                    ),
                    Text(
                      totalTransactions(ref).toDouble().toRupiahCompact,
                      style: SiTextStyles.bold.copyWith(fontSize: 20),
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
    return switch (transactionType) {
      TransactionType.income => IconsaxPlusLinear.import_1,
      TransactionType.expense => IconsaxPlusLinear.export_2,
    };
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
