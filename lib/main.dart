import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/Core/Api/keys.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';

import 'Core/Language/app_languages.dart';
import 'Core/Language/locales.dart';
import 'Core/Theme/theme_cubit.dart';
import 'Core/Theme/theme_model.dart';
import 'Utilities/app_themes.dart';
import 'Utilities/git_it.dart';
import 'Utilities/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: ApiService.subbaseKey, anonKey: ApiService.subbaseAnonKey);
  await GitIt.initGitIt();
  setPathUrlStrategy();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
    BlocProvider<AppLanguage>(create: (_) => AppLanguage()),
    BlocProvider<PortfolioCubit>(create: (_) => sl<PortfolioCubit>()),
  ], child: const EntryPoint()));
}

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

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
    final appLan = context.read<AppLanguage>();
    final bool isArabic = appLan.appLang.name == 'ar';

    bool? isDark = SharedPref.getTheme();
    if (SharedPref.getTheme() == null) {
      final themeState = context.read<ThemeCubit>().state;
      isDark = themeState.isDark;
    }


    final currentTheme = AppThemes.createTheme(
      isArabic: isArabic,
      isDark: isDark??false,
    );
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 599, name: MOBILE),
          const Breakpoint(start: 600, end: 1439, name: TABLET),
          const Breakpoint(start: 1440, end: double.infinity, name: DESKTOP),
        ],
        child: MaterialApp.router(
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
          darkTheme: AppTheme.dark,
          theme: currentTheme,
          themeMode: isDark ==true ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          title:
              GoRouterConfig.router.configuration.navigatorKey.currentContext ==
                      null
                  ? "Portfolio"
                  : html.window.location.href.split("/").last.translate,
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}
