import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;
import 'src/core/core.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Untuk mengatur status bar menjadi transparan
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      await initializeDateFormatting('id_ID');

      runApp(
        ProviderScope(
          retry: (retryCount, error) {
            if (retryCount > 5) return null;
            return Duration(seconds: 3);
          },
          child: const MainApp(),
        ),
      );
    },
    (error, stack) {
      SiLogger.error('AppError : ${error.toString()}');
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
      theme: SiThemes.light,
      routerConfig: router,
    );
  }
}
