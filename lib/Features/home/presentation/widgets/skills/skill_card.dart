import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

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
      child: (h) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Row(
            spacing: 8,
            children: [
              RoundedImage(
                imagePath: skill?.icon ?? "",
                width: 24,
                height: 24,
                borderColor: colors.accent,
                padding: 2,
                fit: BoxFit.fill,
              ),
              Text(
                skill?.category?.toUpperCase() ?? "",
                style: AppTextStyles.titleCard(
                  context: context,
                  color: colors.text1,
                ),
              ),
            ],
          ),
          if (skill?.skills != null)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...List.generate(
                    skill!.skills.length,
                    (i) => CardWithText(
                          text: (skill?.skills[i].skillName ?? ""),
                          hozPadding: 8,
                          vertPadding: 4,
                          maxLine: 3,
                          border: 8,
                          color: i == 0 || i == (skill!.skills.length - 1)
                              ? colors.accent.withValues(alpha: 0.1)
                              : colors.secondary.withValues(alpha: 0.1),
                          borderColor: i == 0 || i == (skill!.skills.length - 1)
                              ? colors.accent.withValues(alpha: 0.1)
                              : colors.secondary.withValues(alpha: 0.1),
                          textColor: colors.text2,
                        ))
              ],
            )
        ],
      ),
    );
  }
}
