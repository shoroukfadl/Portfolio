import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:portfolio/Modules/Home/Widgets/about_me_widget.dart';
import 'package:portfolio/Modules/Home/Widgets/contact_me.dart';
import 'package:portfolio/Modules/Home/Widgets/experince_card_widget.dart';
import 'package:portfolio/Modules/Home/Widgets/my_skills.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/Widgets/custom_rounded_icon_button.dart';

import '../../Core/Theme/theme_model.dart';
import '../../generated/assets.dart';
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
  Future.delayed(Duration.zero ,()async=>  await con.getUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalInfoWidget(),
        Row(
          children: [

            CustomRoundedIconButton(onPressed: (){}, iconPath: Assets.iconLinkedin),
           CustomRoundedIconButton(onPressed: (){}, iconPath: Assets.iconsGithub),
          ],
        ),
       // MySkillsWidget(),
        //ExperienceCardWidget(),
       // AboutMeWidget(),
       // ContactMeWidget(con: con)
      ],
    );
  }
}


