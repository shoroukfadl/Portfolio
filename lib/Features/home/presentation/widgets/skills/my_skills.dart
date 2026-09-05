import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';

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
      this.mainAxisExtent = 160,
      this.hozSpacing = 48,
      this.vertSpacing = 24,
      this.padding = desktopHozPadding,
      this.perRow = 3});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
        large: maxWidth * 2 / 3, medium: maxWidth * 3.2 / 4, small: maxWidth);
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          SectionsTitleWidget(
            index: 1,
            title: Strings.mySkill.translate,
            key: GlobalKeys.skill,
          ),
          ShadowHoverCardWidget(
            cardColor: colors.card,
            borderColor: colors.border,
            paddingHoz: 0,
            width: width,
            paddingVert: 0,
            child: (h) => AnimatedListView<TechnicalSkillEntity>(
              items: skills,
              spacing: 0,
              buildChild: (index) {
                return SkillCard(
                  skill: skills[index],
                  isLast: index == skills.length - 1,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
