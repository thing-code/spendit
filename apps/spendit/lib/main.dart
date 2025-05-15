import 'dart:async';

import 'package:flutter/cupertino.dart';
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
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spend It Remake')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              cursorHeight: 16,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: 'Input Nama',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.chevron_right, color: Colors.red),
              ),
            ),
            SpendItButton.primary(
              text: 'Submit',
              onPressed: () {
                openBottomSheet(
                  context,  
                  title: 'Pilih Tanggal',
                  showCloseIcon: true,
                  builder: (context) {
                    return Column(
                      spacing: 16,
                      children: [
                        SizedBox(
                          height: context.deviceHeight / 5,
                          width: context.deviceWidth,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (value) {},
                            maximumDate: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            dateOrder: DatePickerDateOrder.dmy,
                          ),
                        ),
                        SpendItButton.primary(text: 'Pilih', onPressed: () {}),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
