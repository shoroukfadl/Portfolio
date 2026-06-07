import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

class SkillsSection extends StatelessWidget {
  final List<TechnicalSkillEntity> skills;
  final double hozPadding;
  final TextStyle? titleStyle;
  final TextStyle? nameStyle, contentStyle;
  final double iconSize;
  final int countPerRow;
  const SkillsSection(
      {super.key,
      this.skills = const [],
      this.hozPadding = desktopHozPadding,
      this.titleStyle,
      this.nameStyle,
      this.contentStyle,
      this.iconSize = 40,  this.countPerRow =3,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        SectionsTitleWidget(
          title: Strings.skill.translate.toUpperCase(),
          key: GlobalKeys.skill,
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:countPerRow,
              childAspectRatio: 2.2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          itemBuilder: (c, u) => SkillCard(
            skill: skills[u],
            iconSize: iconSize,
            contentStyle: contentStyle,
            nameStyle: nameStyle,
          ),
          itemCount: skills.length,
        )
      ],
    ).paddingSymmetric(horizontal: hozPadding);
  }
}
