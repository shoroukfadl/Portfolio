import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class SkillCard extends StatelessWidget {
  final TechnicalSkillEntity? skill;
  final int index;
  final TextStyle? nameStyle, contentStyle;
  final double iconSize;

  const SkillCard({
    super.key,
    required this.skill,
    this.iconSize = 40,
    required this.index,
    this.nameStyle,
    this.contentStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Row(
          spacing: 16,
          children: [
            Text(
              skill?.category?.toUpperCase() ?? "",
              style: nameStyle ??
                  AppTextStyles.semiBold14(
                    color: index % 2 == 0 ? colors.accent : colors.secondary,
                  ),
            ),
            Container(
              width: double.infinity,
              height: 0.2,
              color: index % 2 == 0 ? colors.accent : colors.secondary,
            ).expand
          ],
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...List.generate(
                skill?.skills.length ?? 0,
                (i) => AnimatedCardWithText(
                      text: (skill?.skills[i].skillName ?? ""),
                      style: contentStyle,
                      maxLine: 3,
                      animatedColor: index % 2 == 0 ? colors.accent25 : colors.secondary,
                      color: index % 2 == 0
                          ? colors.accent25.withValues(alpha: 0.4)
                          : colors.secondary.withValues(alpha: 0.2),
                      borderColor: Colors.transparent,
                      textColor: index % 2 == 0 ? colors.accent50 : colors.secondary,
                      animatedTextColor: Colors.white,
                    ))
          ],
        )
      ],
    );
  }
}
