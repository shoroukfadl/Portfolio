import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Utilities/extensions.dart';
import '../../Utilities/router_config.dart';
import '../home/presentation/pages/home_view.dart';

class SplashView extends StatefulWidget {
  static String routeName = "/";

  const SplashView({
    super.key,
  });

  @override
  createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    super.initState();
    goToHome();
  }

  void goToHome() {
    Future.delayed(const Duration(seconds: 2),
            () => CURRENT_CONTEXT!.goNamed(HomeView.routeName));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      color: colors.background,
    );
  }
}
