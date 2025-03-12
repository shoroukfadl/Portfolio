import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:portfolio/Modules/Home/Widgets/about_me_widget.dart';
import 'package:portfolio/Modules/Home/Widgets/contact_me.dart';
import 'package:portfolio/Modules/Home/Widgets/experince_card_widget.dart';
import 'package:portfolio/Modules/Home/Widgets/my_skills.dart';
import 'package:portfolio/Modules/Home/home_controller.dart';
import 'package:portfolio/Utilities/extensions.dart';
import '../../../Utilities/text_style_helper.dart';
import '../Widgets/my_projects_widget.dart';
import '../Widgets/personal_info_widget.dart';

class MediumHomeView extends StatelessWidget {
  final HomeController con;
  const MediumHomeView({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.0.heightBox,
        PersonalInfoWidget(
          personalData: con.user?.data?.personalData,
          helloStyle: TextStyleHandler.of(context).displayTextStyleRegular32,
          nameStyle: TextStyleHandler.of(context).displayTextStyleExtraBold32,
          roleStyle: TextStyleHandler.of(context).displayTextStyleExtraBold32,
          developerStyle:
              TextStyleHandler.of(context).outLinedTextStyleExtraBold32,
          basedInStyle: TextStyleHandler.of(context).displayTextStyleRegular32,
          locationStyle: TextStyleHandler.of(context).displayTextStyleRegular32,
          buttonSize: 32,
          imageSize: 380,
        ).paddingSymmetric(horizontal: 32),
        64.0.heightBox,
        MySkillsWidget(
          skills: con.user?.data?.skills ?? [],
          skillSize: 48,
          myStyle: TextStyleHandler.of(context).displayTextStyleExtraBold32,

          skillStyle: TextStyleHandler.of(context).headingTextStyleBold16,
          titleStyle: TextStyleHandler.of(context).displayTextStyleRegular32,
        ).paddingSymmetric(horizontal: 32),
        ExperienceCardWidget(
          items: con.user?.data?.experience ?? [],
          descriptionStyle:
              TextStyleHandler.of(context).headingTextStyleRegular16,
          myStyle: TextStyleHandler.of(context).displayTextStyleExtraBold32,
          titleStyle: TextStyleHandler.of(context).displayTextStyleRegular32,
          dateStyle: TextStyleHandler.of(context).headingTextStyleBold20,
          locationStyle: TextStyleHandler.of(context).headingTextStyleBold20,
          nameStyle: TextStyleHandler.of(context).headingTextStyleBold20,
        ),
        AboutMeWidget(
          desc: con.user?.data?.personalData?.shortDesc ?? "",
        ),
        const MyProjectsWidget(),
        ContactMeWidget(con: con)
      ],
    );
  }
}
