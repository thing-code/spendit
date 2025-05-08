import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
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
      /// Init Sentry hanya saat release
      if (kReleaseMode) {
        await SentryFlutter.init((option) {
          option.dsn = const String.fromEnvironment('SENTRY_DSN');
          option.environment = kReleaseMode ? 'production' : 'development';
        });
      }

      runApp(ProviderScope(child: const MainApp()));
    },
    (error, stack) async {
      /// Kirim error ke Sentry hanya saat release
      if (kReleaseMode) {
        await Sentry.captureException(error, stackTrace: stack);
      }
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
      theme: SpendItTheme.light(fontFamily: FontFamily.poppins),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
      locale: const Locale('en'),
      builder: (context, child) {
        ErrorWidget.builder =
            (errorDetails) => SpendItErrorWidget(errorDetails: errorDetails);
        return child!;
      },
      home: Scaffold(
        backgroundColor: Colors.white,
        persistentFooterButtons: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.notifications_none),
          ),
        ],
        appBar: AppBar(
          title: Text('Spend It Remake'),
          centerTitle: true,
          actions: [
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.notifications_none),
            ),
          ],
          leading: IconButton.filledTonal(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          flexibleSpace: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.transparent),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                cursorHeight: 16,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  labelText: 'Input Nama',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SpendItButton.primary(text: 'Submit', onPressed: () {}),
              Expanded(
                child: ListView(
                  children: List.generate(
                    50,
                    (index) => ListTile(
                      title: Text('${index + 1}', textAlign: TextAlign.center),
                      tileColor: SpendItColors.warningColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
