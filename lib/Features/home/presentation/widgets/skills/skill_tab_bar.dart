import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Widgets/rounded_image_widget.dart';

class SkillNameItem extends StatelessWidget {
  final TechnicalSkillEntity skill;
  final bool hover;
  const SkillNameItem({
    super.key,
    required this.skill,
    required this.hover,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: colors.card, width: 4),
          color: colors.secondary,
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(cardRadius),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          RoundedImage(
            imagePath: skill.icon ?? "",
            width: 20,
            height: 20,
            backgroundColor: colors.accent,
            padding: 2,
            fit: BoxFit.fill,
          ),
          Text(
            skill.category?.toUpperCase() ?? "",
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: colors.background,
            ),
          ),
          0.0.widthBox
        ],
      ),
    );
  }
}
