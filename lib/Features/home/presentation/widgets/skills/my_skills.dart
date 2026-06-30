import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/Animation/animated_list.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class SkillsSection extends StatelessWidget {
  final List<TechnicalSkillEntity> skills;
  final double padding, mainAxisExtent;
  final double iconSize, vertSpacing, hozSpacing;
  final int perRow;

  const SkillsSection(
      {super.key,
      this.skills = const [],
      this.iconSize = 40,
      this.mainAxisExtent = 168,
      this.hozSpacing = 16,
      this.vertSpacing = 16,
      this.padding = desktopHozPadding,
      this.perRow = 4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        spacing: 32,
        children: [
          SectionsTitleWidget(
            title: Strings.skill.translate,
            key: GlobalKeys.skill,
          ),
          AnimatedGridView<TechnicalSkillEntity>(
            perRow: perRow,
            mainAxisExtent: mainAxisExtent,
            items: skills,
            vertSpace: vertSpacing,
            hozSpace: hozSpacing,
            buildChild: (index) {
              return SkillCard(
                skill: skills[index],
                index: index,
                iconSize: iconSize,
              );
            },
          ),
        ],
      ),
    );
  }
}
