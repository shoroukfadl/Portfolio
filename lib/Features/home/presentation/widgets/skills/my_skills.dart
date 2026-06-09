import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

class SkillsSection extends StatelessWidget {
  final List<TechnicalSkillEntity> skills;
  final double hozPadding;
  final double iconSize;
  final int countPerRow;
  const SkillsSection(
      {super.key,
      this.skills = const [],
      this.hozPadding = desktopHozPadding,
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
              childAspectRatio:context.isSmall ? 4.2: context.isMedium ? 1.8: 2.2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          itemBuilder: (c, u) => SkillCard(
            skill: skills[u],
            iconSize: iconSize,

          ),
          itemCount: skills.length,
        )
      ],
    ).paddingSymmetric(horizontal: hozPadding);
  }
}
