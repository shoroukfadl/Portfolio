import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Widgets/Custom/card_with_animation.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity item;

  const EducationCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if(context.isLarge) {
      return EducationContentWidget(item: item);
    } else {
      return SideAnimatedCard(child: EducationContentWidget(item: item));
    }
  }
}

class EducationContentWidget extends StatelessWidget {
  final EducationEntity item;

  const EducationContentWidget({super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.degree ?? "",
          style: AppTextStyles.medium12(
            color: colors.accent,
          ),
        ),

        Text(
          item.duration ?? "",
          style: AppTextStyles.regular10(
            color: colors.secondary,
          ),
        ),
        Text(
          item.university ?? "",
          style: AppTextStyles.regular12(
            color: colors.text2,
          ),
        ),

        Text(
          'Grade: ${item.grade ?? ""}',
          style: AppTextStyles.regular10(
            color: colors.text2,
          ),
        ),
        Text(
          (item.gradProjectTitle ?? ""),
          style: AppTextStyles.regular10(
            color: colors.text2,
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            ...List.generate(
              item.gradProjectTech.length,
              (i) => CardWithText(
                borderColor: Colors.transparent,
                color: colors.secondary.withValues(alpha: 0.1),
                text: item.gradProjectTech[i],
                style: AppTextStyles.regular8(
                  color: colors.secondary,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
