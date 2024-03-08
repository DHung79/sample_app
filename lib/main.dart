// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample_app/widgets/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/route_config.dart';
import 'themes/theme_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
  //   await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  // }
  runApp(const MyApp());
}

Future<SharedPreferences> prefs = SharedPreferences.getInstance();
final List<Locale> supportedLocales = <Locale>[
  const Locale('vi'),
  const Locale('en'),
];
Locale currentLocale = supportedLocales[0];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sample App',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.lightTheme,
      darkTheme: ThemeConfig.lightTheme,
      builder: (context, child) => child!,
      scrollBehavior: MyCustomScrollBehavior(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales,
      locale: currentLocale,
    );
  }
}
