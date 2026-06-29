import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_tab_bar.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class SkillCard extends StatelessWidget {
  final TechnicalSkillEntity skill;
  final int index;
  final double iconSize, height;

  const SkillCard({
    super.key,
    required this.skill,
    this.iconSize = 40,
    this.height = 140,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ZoomOutAnimatedCardWidget(
          width: double.infinity,
          height: height,
          child: (h) => Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...List.generate(
                skill.skills.length,
                (i) => CardWithText(
                    text: (skill.skills[i].skillName ?? ""),
                    hozPadding: 8,
                    vertPadding: 4,
                    maxLine: 3,
                    border: 100,
                    color: i == 0 || i == (skill.skills.length - 1)
                        ? colors.text1.withValues(alpha: 0.1)
                        : colors.text2.withValues(alpha: 0.1),
                    borderColor: Colors.transparent,
                    textColor: i == 0 || i == (skill.skills.length - 1)
                        ? colors.text1
                        : colors.text2),
              )
            ],
          ).paddingOnly(top: 16),
        ),
        Positioned(top: -16, child: SkillNameItem(skill: skill, hover: true)),
      ],
    );
  }
}
