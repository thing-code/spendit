import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:spendit_core/spendit_core.dart';
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
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
        Locale('en', 'GB'),
      ],
      locale: const Locale('id', 'ID'),
      builder: (context, child) {
        ErrorWidget.builder = (errorDetails) =>
            SpendItErrorWidget(errorDetails: errorDetails);
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
                  Text(
                    'Saldo Terkini',
                    style: SpendItTextStyles.medium.copyWith(fontSize: 16),
                  ),
                  Text(
                    'Rp 1.000.000',
                    style: SpendItTextStyles.bold.copyWith(fontSize: 24),
                  ),
                  Gap(24),

                  Row(
                    spacing: 16,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              'Statistik',
                              style: SpendItTextStyles.medium.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: SpendItColors.neutralColor,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: SpendItColors.primaryColor
                                        .withValues(alpha: .1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 16,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        SolarIconsOutline.squareArrowLeftDown,
                                        color: SpendItColors.successColor,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: SpendItColors.successCardColor,
                                          borderRadius: BorderRadius.circular(
                                            1000,
                                          ),
                                        ),
                                        child: Text(
                                          '5%',
                                          style: SpendItTextStyles.medium
                                              .copyWith(
                                                color:
                                                    SpendItColors.successColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Pemasukan'),
                                      Text('Rp 40 jt'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
                              style: SpendItTextStyles.medium.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              color: SpendItColors.accentColor.shade400,
                              child: AspectRatio(aspectRatio: 3 / 4),
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
        boxShadow: [
          BoxShadow(
            color: SpendItColors.primaryColor.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            backgroundColor: SpendItColors.accentColor.shade200,
            foregroundColor: SpendItColors.primaryColor,
            child: Icon(SolarIconsBold.user),
          ),
          Text(
            'Welcome back!',
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
