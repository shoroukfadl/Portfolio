import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:portfolio/Core/Layout/layout_handler.dart';
import 'package:portfolio/Modules/Home/Layouts/l_home_view.dart';
import 'package:portfolio/Modules/Home/Layouts/m_home_view.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';

import 'Layouts/s_home_view.dart';
import 'home_controller.dart';

class HomeView extends StatefulWidget {
  static String routeName = ScreenRoutes.home.name;
  const HomeView({
    super.key,
  });

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView>  with LayoutHandlerMixin {

  _HomeViewState() : super(HomeController()) {
    con = HomeController();
  }
  late HomeController con;

  @override
  void initState() {
    super.initState();
  Future.delayed(Duration.zero ,()async=>  await con.getUserData());
  }



  @override
  Widget build(BuildContext context) {
  return buildLayout(context);
  }

  @override
  Widget buildLargeScreen() {
    return LargeHomeView(con: con);
  }

  @override
  Widget buildMediumScreen() {
    return MediumHomeView(con: con);
  }

  @override
  Widget buildSmallScreen() {
    return SmallHomeView(con: con);
  }



}


