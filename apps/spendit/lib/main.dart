import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit_core/spendit_core.dart';
import 'package:spendit_remake/src/gen/assets.gen.dart';
import 'package:spendit_remake/src/gen/fonts.gen.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Untuk mengatur status bar menjadi transparan
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      runApp(ProviderScope(child: const MainApp()));
    },
    (error, stack) async {
      logger.error(error);
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spend It : Manage your spending',
      theme: SpendItTheme.light(fontFamily: FontFamily.geist),
      localizationsDelegates: const [
        SpendItLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID'), Locale('en', 'GB')],
      locale: const Locale('id', 'ID'),
      builder: (context, child) {
        ErrorWidget.builder = (errorDetails) => SpendItErrorWidget(errorDetails: errorDetails);
        return child!;
      },
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final balance = 1000000.toDouble().toRupiah;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpendItHeader(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo Terkini', style: SpendItTextStyles.medium.copyWith(fontSize: 16)),
                  Text(balance, style: SpendItTextStyles.bold.copyWith(fontSize: 24)),
                  Gap(24),
                  Row(
                    spacing: 16,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              'Statistik',
                              style: SpendItTextStyles.medium.copyWith(fontSize: 16),
                            ),
                            StatisticCard(transactionType: TransactionType.income),
                            StatisticCard(transactionType: TransactionType.expense),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              'Anggaran',
                              style: SpendItTextStyles.medium.copyWith(fontSize: 16),
                            ),
                            AspectRatio(
                              aspectRatio: 3 / 4.1,
                              child:
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8),
                                            child: CircularProgressIndicator(
                                              value: .7,
                                              strokeWidth: 8,
                                              constraints: BoxConstraints(
                                                minHeight: 80,
                                                minWidth: 80,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text('Terpakai'),
                                              Badge(
                                                label: Text(
                                                  '${700000.toDouble().toRupiahCompact} dari ${1200000.toDouble().toRupiahCompact}',
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 2,
                                                ),
                                                backgroundColor: SpendItColors.accentColor.shade400,
                                                textColor: SpendItColors.primaryColor,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Anggaran Bulanan'),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    1200000.toDouble().toRupiahCompact,
                                                    style: SpendItTextStyles.bold.copyWith(
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                  Icon(SolarIconsOutline.altArrowRight),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).onTap(
                                    onTap: () {
                                      Toast.show(context, title: 'THIS IS A TEST TOAST');
                                    },
                                  ),
                            ),
                          ],
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
    );
  }
}

class StatisticCard extends StatelessWidget {
  const StatisticCard({super.key, required this.transactionType});

  final TransactionType transactionType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.deviceWidth,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Icon(icon, color: transactionType.fg),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transactionType.label),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        1000000.toDouble().toRupiahCompact,
                        style: SpendItTextStyles.bold.copyWith(fontSize: 24),
                      ),
                      Icon(SolarIconsOutline.altArrowRight),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData get icon {
    switch (transactionType) {
      case TransactionType.income:
        return SolarIconsOutline.squareArrowLeftDown;
      case TransactionType.expense:
        return SolarIconsOutline.squareArrowRightUp;
    }
  }
}

// openBottomSheet(
//   context,
//   title: 'Pilih Tanggal',
//   showCloseIcon: true,
//   height: context.deviceHeight * .6,
//   builder: (context) {
//     return Column(
//       children: [
//         CalendarDatePicker(
//           initialDate: DateTime.now(),
//           firstDate: DateTime(2021),
//           lastDate: DateTime(2030),
//           onDateChanged: (value) {},
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: SpendItButton.primary(
//             text: 'Pilih',
//             onPressed: () {},
//           ),
//         ),
//       ],
//     );
//   },
// );

class SpendItHeader extends StatelessWidget {
  const SpendItHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * .07,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: SpendItColors.neutralColor,
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [SpendItStyles.cardShadow],
      ),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            backgroundColor: SpendItColors.primaryColor,
            child: Assets.icon.image(width: 24, height: 24, fit: BoxFit.cover),
          ),
          Text(
            'Selamat Datang Kembali!',
            style: SpendItTextStyles.medium.copyWith(
              fontSize: 16,
              color: SpendItColors.primaryColor,
            ),
          ),
          const Spacer(),
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: SpendItColors.accentColor.shade200,
              foregroundColor: SpendItColors.primaryColor,
            ),
            onPressed: () {},
            icon: Icon(SolarIconsOutline.history),
          ),
        ],
      ),
    );
  }
}
