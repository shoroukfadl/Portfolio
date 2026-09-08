import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_html/html.dart' as html;

import '../Features/home/presentation/pages/home_view.dart';
import '../Widgets/MainLayout/main_layout_widget.dart';
import '../seo_helper.dart';

BuildContext? get CURRENT_CONTEXT =>
    GoRouterConfig.router.routerDelegate.navigatorKey.currentContext;

class GoRouterConfig {
  static String getServerUrl() {
    String completeUrl = html.window.location.href;
    Uri uri = Uri.parse(completeUrl);
    String serverUrl =
        '${uri.scheme}://${uri.host}${uri.hasPort ? ":${uri.port}" : ""}';
    print("com :$completeUrl");
    return serverUrl;
  }

  static void popUntilPath(String pattern) {
    final RouteMatch lastMatch =
        _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    final router = GoRouter.of(CURRENT_CONTEXT!);

    while (location.contains(pattern)) {
      if (!router.canPop()) return;
      router.pop();
    }
  }

  static Future popAllFromBrowser() async {
    while (
        html.window.location.href.replaceAll(getServerUrl(), "").length > 2) {
      html.window.history.back();
      await Future.delayed(Duration.zero);
    }
  }

  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      ShellRoute(
          builder: (context, state, child) {
            return MainLayoutWidget(
              currentPath: state.fullPath,
              child: child,
            );
          },
          routes: [
            GoRoute(
              name: '/',
              path: "/",
              redirect: (_, s) {
                SeoHelper.setMetaTags(
                  title: "Shorouk Fadl | شروق فضل",
                  description:
                      "Flutter Developer With Experience in Flutter Framework , Scalable Application [Web , Ios ,Android] ",
                );
                return null;
              },
              pageBuilder: (_, GoRouterState state) {
                return getCustomTransitionPage(
                  state: state,
                  child: const HomeView(),
                );
              },
            )
          ]),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      return null;
    },
  );

  static CustomTransitionPage getCustomTransitionPage(
      {required GoRouterState state, required Widget child}) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,

      /// i hava chaged this form 300 to 0
      transitionDuration: const Duration(milliseconds: 0),
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      },
    );
  }
}
