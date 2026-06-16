import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class SkillCard extends StatelessWidget {
  final TechnicalSkillEntity? skill;
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
    return ZoomOutAnimatedCardWidget(
      child:(h)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Text(
            skill?.category?.toUpperCase() ?? "",
            style:
                AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.text1,
                ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...List.generate(
                  skill?.skills.length ?? 0,
                  (i) => CardWithText(
                        text: (skill?.skills[i].skillName ?? ""),

                        maxLine: 3,
                        border: 8,
                        color: i  == 0 ? colors.accent.withValues(alpha: 0.1): colors.text3.withValues(alpha: 0.1),
                        borderColor:Colors.transparent,
                        textColor:
                            i == 0 ?colors.accent : colors.text2,
                      ))
            ],
          )
        ],
      ),
    );
  }
}
