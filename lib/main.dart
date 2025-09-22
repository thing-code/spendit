import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart' show initializeDateFormatting;
import 'package:spendit/src/common/common.dart';
import 'package:spendit/src/gen/assets.gen.dart';
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SiThemes.light,
      home: AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: Assets.icons.icon.image(height: 56),
                  ),
                ),
                24.space,
                Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Please login to continue',
                  style: TextStyle(fontSize: 16, color: SiColors.textSecondary),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
