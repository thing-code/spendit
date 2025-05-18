import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
      locale: const Locale('id'),
      builder: (context, child) {
        ErrorWidget.builder =
            (errorDetails) => SpendItErrorWidget(errorDetails: errorDetails);
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
          children: [
            Container(
              height: context.deviceHeight * .07,
              width: double.infinity,
              margin: EdgeInsets.all(16),
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
                    child: Icon(SolarIconsOutline.user),
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
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 20,
                children: [
                  TextField(
                    cursorHeight: 16,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: 'Input Nama',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SpendItButton.primary(
                    text: 'Submit',
                    onPressed: () {
                      openBottomSheet(
                        context,
                        title: 'Pilih Tanggal',
                        showCloseIcon: true,
                        height: context.deviceHeight * .6,
                        builder: (context) {
                          return Column(
                            children: [
                              CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2030),
                                onDateChanged: (value) {},
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: SpendItButton.primary(
                                  text: 'Pilih',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
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
