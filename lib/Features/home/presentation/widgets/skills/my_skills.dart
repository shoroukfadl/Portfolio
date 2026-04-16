import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Core/Theme/theme_colors.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

class MySkillsWidget extends StatelessWidget {
  final List<SkillModel> skills;
  final TextStyle? skillStyle, titleStyle, myStyle;
  final double? skillSize;

  const MySkillsWidget(
      {super.key,
      this.skills = const [],
      this.skillStyle,
      this.titleStyle,
      this.skillSize,
      this.myStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 40),
      decoration: const BoxDecoration(
          gradient: AppColors.gradientCardLight,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionsTitleWidget(
            key: GlobalKeys.skill,
            title: Strings.skill.translate,
            titleStyle: titleStyle,
            myStyle: myStyle,
          ),
          SizedBox(
            height: 300,
            child: ListView.separated(
                itemCount: skills.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (c, i) => 16.0.widthBox,
                itemBuilder: (c, i) => SkillCardWidget(
                      skill: skills[i],
                      skillStyle: skillStyle,
                    )),
          ),
          32.0.heightBox,
        ],
      ),
    );
  }
}
