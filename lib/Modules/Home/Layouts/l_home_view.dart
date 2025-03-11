import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:portfolio/Modules/Home/Widgets/about_me_widget.dart';
import 'package:portfolio/Modules/Home/Widgets/contact_me.dart';
import 'package:portfolio/Modules/Home/Widgets/experince_card_widget.dart';
import 'package:portfolio/Modules/Home/Widgets/my_skills.dart';
import 'package:portfolio/Modules/Home/home_controller.dart';
import 'package:portfolio/Utilities/extensions.dart';
import '../Widgets/my_projects_widget.dart';
import '../Widgets/personal_info_widget.dart';


class LargeHomeView extends StatelessWidget {
  final  HomeController con;
  const LargeHomeView({
    super.key,
  required  this.con
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.0.heightBox,
        PersonalInfoWidget(
          personalData: con.user?.data?.personalData,
        ).paddingSymmetric(horizontal: 32),

        64.0.heightBox,

        MySkillsWidget(
          skills: con.user?.data?.skills??[],
        ).paddingSymmetric(horizontal: 32),
        const ExperienceCardWidget(),
        AboutMeWidget(
          desc: con.user?.data?.personalData?.shortDesc??"",
        ),
        const MyProjectsWidget(),
        ContactMeWidget(con: con)
      ],
    );
  }
}


