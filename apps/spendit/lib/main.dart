import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
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

      /// Untuk mengatur warna pembatas pada setiap widget saat mode debug
      // debugRepaintRainbowEnabled = true;
      // Init Sentry
      await SentryFlutter.init((option) {
        option.dsn = const String.fromEnvironment('SENTRY_DSN');
      });
      runApp(ProviderScope(child: const MainApp()));
    },
    (error, stack) async {
      await Sentry.captureException(error, stackTrace: stack);
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
      theme: SpendItTheme.normal(fontFamily: FontFamily.poppins),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
      locale: const Locale('en'),
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  SpendItColors.primaryColor.shade600,
                  SpendItColors.primaryColor.shade400,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Row(
              spacing: 16,
              children: [
                Flexible(
                  child: TextField(
                    style: TextStyle(
                      color: SpendItColors.primaryColor.shade900,
                      fontSize: 12,
                    ),
                  ),
                ),
                Flexible(
                  child: TextField(
                    style: TextStyle(
                      color: SpendItColors.primaryColor.shade900,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: SpendItButton.primary(
                    text: 'Button',
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: SpendItButton.secondary(
                    text: 'Button',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SpendItButton.text(text: 'Button', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
