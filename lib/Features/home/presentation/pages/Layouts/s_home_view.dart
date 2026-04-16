import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../Homel/home_controller.dart';
import '../../widgets/aboutMe/about_me_widget.dart';
import '../../widgets/contact_me.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/my_projects_widget.dart';
import '../../widgets/skills/my_skills.dart';

class SmallHomeView extends StatelessWidget {
  final HomeController con;

  const SmallHomeView({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.0.heightBox,
        // PersonalInfoWidget(
        //   personalData: con.user?.summary,
        // ).paddingSymmetric(horizontal: 32),

        64.0.heightBox,

        MySkillsWidget(
          skills: con.user?.skills ?? [],
        ).paddingSymmetric(horizontal: 32),
        ExperienceCardWidget(
          items: con.user?.experience ?? [],
        ),
        AboutMeWidget(
          name: con.user?.name ?? "",
          role: con.user?.jobName ?? "",
          desc: con.user?.summary ??
              "Jenny’s Exceptional product design ensure our website’s success. Highly Recommended",
        ),
        MyProjectsWidget(
          projects: con.user?.project ?? [],
        ),
        ContactMeWidget(con: con)
      ],
    );
  }
}
