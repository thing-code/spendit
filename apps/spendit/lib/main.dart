import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spendit/src/gen/fonts.gen.dart';
import 'package:spendit/src/routers/routers.dart';
import 'package:spendit_core/spendit_core.dart';

import 'src/database/database.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Untuk mengatur status bar menjadi transparan
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      // Inisialisasi SQLite Database
      final db = await SQLiteDatabaseUtils.initDatabase();

      runApp(
        ProviderScope(overrides: [databaseProvider.overrideWithValue(db)], child: const MainApp()),
      );
    },
    (error, stack) async {
      logger.error(error);
    },
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Spend It : Manage your spending',
      theme: SpendItTheme.light(fontFamily: FontFamily.figtree),
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
      routerConfig: router,
    );
  }
}
