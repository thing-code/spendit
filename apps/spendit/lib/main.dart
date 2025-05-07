import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:spendit_core/spendit_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Untuk mengatur status bar menjadi transparan
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  /// Untuk mengatur warna pembatas pada setiap widget saat mode debug
  // debugRepaintRainbowEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spend It : Manage your spending',
      theme: SpendItTheme.normal(fontFamily: 'Nunito'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
      locale: const Locale('en'),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
            child: const Text('Spend It'),
          ),
          forceMaterialTransparency: true,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(16),
            child: Container(),
          ),
        ),
        body: ListView(
          children: List.generate(
            100,
            (index) => Container(
              height: 100,
              color:
                  index.isEven
                      ? SpendItColors.primaryColor.shade300
                      : SpendItColors.primaryColor.shade200,
              child: Center(child: Text('Item $index')),
            ),
          ),
        ),
      ),
    );
  }
}
