import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

import '../../../../../Core/Theme/theme_colors.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.skill,
    required this.isLast,
  });

  final TechnicalSkillEntity skill;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Text(
                skill.category ?? '',
                style: AppTextStyles.hc1(context: context, color: colors.text1),
              )
                  .paddingSymmetric(vertical: 16, horizontal: 16)
                  .expandFlex(context.isLarge ? 1 : 2),
              VerticalDividerWidget(color: colors.border),
              _buildSkillTags(context, colors).expandFlex(4),
            ],
          ),
        ),
        if (!isLast) const DividerWidget(),
      ],
    );
  }

  Widget _buildSkillTags(BuildContext context, AppColors colors) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skill.skills
          .map((s) => AnimatedCardWithText(
                text: s.skillName ?? '',
                hozPadding: 8,
                vertPadding: 8,
                maxLine: 3,
                border: 4,
                borderWidth: 0.2,
                color: colors.accentSoft,
                borderColor: colors.accentSoft,
                textColor: colors.text1,
              ))
          .toList(),
    ).paddingSymmetric(horizontal: 16, vertical: 16);
  }
}
