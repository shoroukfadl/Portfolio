import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Widgets/Custom/card_with_floating_title.dart';

class SkillCard extends StatelessWidget {
  final TechnicalSkillEntity skill;
  final int index;
  final double iconSize;

  const SkillCard({
    super.key,
    required this.skill,
    this.iconSize = 40,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CardWithTitle(
        width: double.infinity,
        cardColor: colors.background,
        borderColor: colors.text3,
        paddingHoz: 16,
        paddingVert: 8,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 4,
              children: [
                CircleAvatar(
                  radius: 4,
                  backgroundColor: colors.accent,
                ),
                Text(
                  skill.category ?? "",
                  style: AppTextStyles.titleCard(
                      context: context, color: colors.text1),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...List.generate(skill.skills.length, (i) {
                  final activeColor = i == 0 || i == (skill.skills.length - 1)
                      ? colors.secondary
                      : colors.text2;
                  return CardWithText(
                    text: (skill.skills[i].skillName ?? ""),
                    hozPadding: 8,
                    vertPadding: 4,
                    maxLine: 3,
                    border: 4,
                    borderWidth: 0.2,
                    color: activeColor.withValues(alpha: 0.05),
                    borderColor: activeColor.withValues(alpha: 0.5),
                    textColor: activeColor,
                  );
                })
              ],
            ).expand
          ],
        ));
  }
}
