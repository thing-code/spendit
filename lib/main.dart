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
            if (retryCount > 4) return null;
            return Durations.medium1;
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
      scrollBehavior: MaterialScrollBehavior().copyWith(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      ),
      debugShowCheckedModeBanner: false,
      theme: SiTheme.dark,
      routerConfig: router,
    );
  }
}
