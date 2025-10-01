import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;
import 'package:spendit/src/core/common.dart';
import 'package:spendit/src/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Untuk mengatur status bar menjadi transparan
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      await initializeDateFormatting('id_ID');

      await Supabase.initialize(
        url: const String.fromEnvironment('SUPABASE_PROJECT_URL'),
        anonKey: const String.fromEnvironment('SUPABASE_PUBLIC_KEY'),
        debug: kDebugMode,
      );

      runApp(ProviderScope(child: const MainApp()));
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
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: SiThemes.light,
      routerConfig: router,
    );
  }
}
