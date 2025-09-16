import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;
import 'package:spendit/src/common/common.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Untuk mengatur status bar menjadi transparan
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      await initializeDateFormatting('id_ID');

      runApp(ProviderScope(child: const MainApp()));
    },
    (error, stack) {
      SiLogger.error('AppError : ${error.toString()}');
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SiThemes.light,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Welcome Back!', style: TextStyle(fontSize: 20)),
              CircleAvatar(
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // * Balance
            BalanceSection(),
            SizedBox(height: 12),
            // * Income and Expense
            TransactionTypeSection(),
            SizedBox(height: 16),
            Text('Goals', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: SiColors.grayscale2),
                color: Colors.white,
              ),
              child: Row(
                spacing: 12,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: SiColors.secondarySurface,
                    ),
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedTarget02,
                      color: SiColors.secondary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Vespa Matic',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            HugeIcon(
                              icon:
                                  HugeIcons.strokeRoundedMoreHorizontalCircle01,
                              color: SiColors.textPrimary,
                            ),
                          ],
                        ),
                        LinearProgressIndicator(value: .5),
                        Row(
                          spacing: 8,
                          children: [
                            Text.rich(
                              style: TextStyle(),
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Rp 16.000.000',
                                    style: TextStyle(
                                      color: SiColors.textSecondary,
                                    ),
                                  ),
                                  TextSpan(text: ' / '),
                                  TextSpan(text: 'Rp 32.000.000'),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: SiColors.grayscale1,
                              ),
                              child: Text(
                                '50%',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionTypeSection extends StatelessWidget {
  const TransactionTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(child: TransactionTypeCard(TransactionType.income)),
        Expanded(child: TransactionTypeCard(TransactionType.expense)),
      ],
    );
  }
}

class TransactionTypeCard extends StatelessWidget {
  const TransactionTypeCard(this.type, {super.key});

  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final background = switch (type) {
      TransactionType.income => SiColors.successSurface,
      TransactionType.expense => SiColors.dangerSurface,
      _ => SiColors.primarySurface,
    };

    final icon = switch (type) {
      TransactionType.income => HugeIcon(
        icon: HugeIcons.strokeRoundedAdd01,
        color: SiColors.success,
      ),
      TransactionType.expense => HugeIcon(
        icon: HugeIcons.strokeRoundedMinusSign,
        color: SiColors.danger,
      ),
      _ => HugeIcon(
        icon: HugeIcons.strokeRoundedArrowDataTransferHorizontal,
        color: SiColors.primary,
      ),
    };

    final name = switch (type) {
      TransactionType.income => 'Incomes',
      TransactionType.expense => 'Expenses',
      _ => 'Transfers',
    };

    return Card(
      child: InkResponse(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            spacing: 12,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: background,
                ),
                child: icon,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(color: SiColors.textSecondary)),
                    Text(
                      'Rp 1,5 jt',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Balance',
                  style: TextStyle(color: SiColors.textSecondary),
                ),
                HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowUpRight03,
                  color: SiColors.textSecondary,
                ),
              ],
            ),
            Text(
              'Rp 1.000.000',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: SiColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
