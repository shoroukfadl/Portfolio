import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Widgets/Custom/card_with_floating_title.dart';
import '../../../../../Widgets/rounded_image_widget.dart';

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
    return CardWithFloatingTitle(
        height: height,
        title: skill.category ?? "",
        width: double.infinity,
        backgroundColor: colors.text1,
        leadingWidget: RoundedImage(
          imagePath: skill.icon ?? "",
          width: 20,
          height: 20,
          backgroundColor: colors.accent,
          padding: 2,
          fit: BoxFit.fill,
        ),
        child: Wrap(
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
        ).paddingOnly(top: 16));
  }
}
