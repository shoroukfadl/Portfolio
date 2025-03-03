import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:rocklis/Utilities/Constants/enums.dart';
import 'package:rocklis/Utilities/text_style_helper.dart';

import '../../Core/Theme/theme_model.dart';
import 'Widgets/personal_info_widget.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  static String routeName = ScreenRoutes.home.name;
  const HomeView({
    super.key,
  });

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView> {
  _HomeViewState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  void initState() {
    super.initState();
    con.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalInfoWidget()
      ],
    );
  }
}


