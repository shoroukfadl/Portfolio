
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rocklis/Utilities/extensions.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';

import 'Core/Language/app_languages.dart';
import 'Core/Language/locales.dart';
import 'Core/Theme/theme_model.dart';
import 'Core/Theme/theme_provider.dart';
import 'Utilities/git_it.dart';
import 'Utilities/router_config.dart';


void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    setPathUrlStrategy();
    // تهيئة Firebase







  } catch (e) {
    print("Error: $e");
  }
  await GitIt.initGitIt();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
    ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
  ], child: const EntryPoint()));
}



class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  static Size largeSize = const Size(1920, 1080);
  static Size mediumSize = const Size(1280, 800);
  static Size smallSize = const Size(428, 926);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    appLan.fetchLocale(context);
    Provider.of<ThemeProvider>(context).getCurrentTheme();
    return LayoutBuilder(
      builder: (context, constraints) {
        Size appSize = EntryPoint.largeSize;
        if (constraints.maxWidth <= 768) {
          appSize = EntryPoint.smallSize;
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth > 768) {
          appSize = EntryPoint.mediumSize;
        } else {
          appSize = EntryPoint.largeSize;
        }
        return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
          themeProvider.getCurrentTheme();
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: ScreenUtilInit(
              designSize: appSize,
              builder: (_, __) => MaterialApp.router(
                locale: Locale(appLan.appLang.name),
                supportedLocales:
                    Languages.values.map((e) => Locale(e.name)).toList(),
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.noScaling,
                      boldText: false,
                    ),
                    child: child!,
                  );
                },
                scrollBehavior: MyCustomScrollBehavior(),
                routerConfig: GoRouterConfig.router,
                theme: ThemeData(
                  scaffoldBackgroundColor: ThemeFactory.of(context).primary,
                ),
                debugShowCheckedModeBanner: false,
                title: GoRouterConfig
                            .router.configuration.navigatorKey.currentContext ==
                        null
                    ? "Portfolio"
                    : html.window.location.href.split("/").last.translate,
              ),
            ),
          );
        });
      },
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
