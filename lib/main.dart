import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
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
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Goals',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 12, color: SiColors.textSecondary),
                ),
              ],
            ),
            Gap(16),
            GoalCard(),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See All',
                  style: TextStyle(fontSize: 12, color: SiColors.textSecondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: SiColors.secondary.withValues(alpha: .1),
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedTarget02,
                    color: SiColors.secondary,
                    size: 20,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: SiColors.grayscale1,
                            border: Border.all(color: SiColors.grayscale2),
                          ),
                          child: Text('50%', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                    LinearProgressIndicator(value: .5),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '16.000.000',
                            style: TextStyle(color: SiColors.textSecondary),
                          ),
                          TextSpan(text: ' / '),
                          TextSpan(
                            text: '32.000.000',
                            style: TextStyle(fontWeight: FontWeight.w600),
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
      ),
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
      _ => SiColors.background,
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: background,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp 500 rb',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              icon,
            ],
          ),
          Text(
            name,
            style: TextStyle(fontSize: 12, color: SiColors.textSecondary),
          ),
          Gap(4),
        ],
      ),
    );
  }
}

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkResponse(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 4,
            children: [
              Align(
                alignment: AlignmentGeometry.topRight,
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowUpRight03,
                  color: SiColors.textSecondary,
                ),
              ),
              Text(
                'Rp 1.000.000',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: SiColors.primary,
                ),
              ),
              Text('Balance', style: TextStyle(color: SiColors.textSecondary)),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: TransactionTypeCard(TransactionType.income),
                    ),
                    Expanded(
                      child: TransactionTypeCard(TransactionType.expense),
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
