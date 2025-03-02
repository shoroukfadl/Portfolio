import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rocklis/Modules/Splash/splash_controller.dart';

import '../../Core/Theme/theme_model.dart';

class SplashView extends StatefulWidget {
  static String routeName = "/";
  const SplashView({
    super.key,
  });

  @override
  createState() => _SplashViewState();
}

class _SplashViewState extends StateMVC<SplashView> {
  _SplashViewState() : super(SplashController()) {
    con = SplashController();
  }
  late SplashController con;

  @override
  void initState() {
    super.initState();
    con.goToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeFactory.of(context).backgroundColor,
    );
  }
}
