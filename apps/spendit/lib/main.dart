import 'dart:async';

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
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DefaultBottomSheet(
                      showCloseIcon: true,
                      title: 'Choose Date',
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

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({super.key, this.showCloseIcon = false, this.title});

  final bool showCloseIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 56,
            child: Stack(
              children: [
                if (!showCloseIcon)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: SpendItColors.primaryColor.shade100,
                        ),
                        height: 6,
                        width: 48,
                      ),
                    ),
                  ),
                if (showCloseIcon)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: SpendItColors.primaryColor.shade100,
                        foregroundColor: SpendItColors.primaryColor,
                        iconSize: 16,
                      ),
                      constraints: BoxConstraints(maxWidth: 40, maxHeight: 40),
                      onPressed: () => _popModal(context),
                      icon: Icon(Icons.close),
                    ),
                  ),
                if (title case final String title)
                  Positioned(
                    left: 16,
                    top: showCloseIcon ? 12 : 24,
                    child: Text(
                      title,
                      style: SpendItTextStyles.semibold.copyWith(fontSize: 18),
                    ),
                  ),
              ],
            ),
          ),
          ...List.generate(3, (index) {
            return Material(child: Text('Index ${index + 1}'));
          }),
        ],
      ),
    );
  }

  void _popModal(BuildContext context) {
    Navigator.pop(context);
  }
}
