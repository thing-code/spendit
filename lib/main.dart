import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/common/common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(ProviderScope(child: const MainApp()));
}

final scaffoldMsgKey = GlobalKey<ScaffoldMessengerState>();

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: FontSizeResolvers.height,
      builder: (context, _) {
        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldMsgKey,
          title: 'Spend It : Atur Pengeluaranmu',
          theme: COSTheme.light,
          // darkTheme: COSTheme.dark,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
          locale: const Locale('en'),
          builder: (context, child) {
            return Stack(
              children: [
                child!,
                // Loading Widget
                LoadingOverlay(),
                // Error Connection Widget
              ],
            );
          },
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}
