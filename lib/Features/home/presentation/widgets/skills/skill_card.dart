import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
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
    return AnimatedCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text(
            skill?.category?.toUpperCase() ?? "",
            style: nameStyle ??
                AppTextStyles.semiBold14(
                  color: colors.accent,
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
                        style: contentStyle,
                        maxLine: 3,
                        color:
                            index % 2 == 0 ? colors.secondary : colors.surface,
                        borderColor:
                            index % 2 == 0 ? colors.secondary : colors.surface,
                        textColor:
                            index % 2 == 0 ? colors.secondaryEv : colors.text2,
                      ))
            ],
          )
        ],
      ),
    );
  }
}
