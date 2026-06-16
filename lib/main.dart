import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

import 'Core/Api/keys.dart';
import 'Core/Language/app_languages.dart';
import 'Core/Language/locales.dart';
import 'Core/Theme/theme_colors.dart';
import 'Core/Theme/theme_cubit.dart';
import 'Core/Theme/theme_state.dart';
import 'Utilities/app_themes.dart';
import 'Utilities/git_it.dart';
import 'Utilities/router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(url:SupabaseConfig.url, anonKey:SupabaseConfig.anonKey );
  await Supabase.initialize(
      url: 'https://itpuoirsozxiqrlngvlw.supabase.co', anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml0cHVvaXJzb3p4aXFybG5ndmx3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU5MTczODgsImV4cCI6MjA5MTQ5MzM4OH0.Dkgdkqf8YXkNQ09XlxvOSsTiv0Bmuvc9PXR5rPPIPe8');
  await GitIt.initGitIt();
  setPathUrlStrategy();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()..getCurrentTheme()),
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
  Widget build(BuildContext context) {
    final appLan = context.watch<AppLanguage>();
    final bool isArabic = appLan.appLang.name == 'ar';

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        final bool isDark = themeState.isDark;
        final currentTheme = AppThemes.createTheme(
          isArabic: isArabic,
          isDark: isDark,
        ).copyWith(
          extensions: <ThemeExtension<dynamic>>[
            isDark ? AppColors.darkValues : AppColors.lightValues,
          ],
        );

        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ResponsiveBreakpoints.builder(
            breakpoints: [
              const Breakpoint(start: 0, end: 599, name: MOBILE),
              const Breakpoint(start: 600, end: 1439, name: TABLET),
              const Breakpoint(
                  start: 1440, end: double.infinity, name: DESKTOP),
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
              theme: currentTheme,
              themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              title: "Portfolio",
            ),
          ),
        );
      },
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
