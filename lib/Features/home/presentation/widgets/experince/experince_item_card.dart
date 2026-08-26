import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../domain/entities/experince_entity.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceEntity item;

  const ExperienceCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CardWithTitle(
        paddingHoz: !context.isSmall ? 24 : 8,
        paddingVert: 16,
        cardColor: colors.background,
        width: double.infinity,
        child: _content(context, colors));
  }

  Widget _content(
    BuildContext context,
    AppColors colors,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.0.heightBox,
        Text(
          item.positionTitle ?? "",
          style: AppTextStyles.titleCard2(
            context: context,
            color: colors.text1,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${item.companyName ?? ""} . ${item.location ?? ""}",
              style: AppTextStyles.location(
                context: context,
                color: colors.text2,
              ),
            ).expand,
            if (!context.isSmall) location(colors, context),
          ],
        ),
        const SizedBox(height: 8),
        if (context.isSmall) ...[
          location(colors, context),
          const SizedBox(height: 8),
        ],
        ...item.description.map(
          (e) => PointText(point: e),
        ),
      ],
    );
  }

  Widget location(AppColors colors, BuildContext context) => CardWithText(
        text: "${item.startDate?.yyyyMM ?? ""}"
                " - "
                "${item.endDate?.yyyyMM ?? "Present"}" +
            " . ${item.employmentType ?? ""}",
        color: colors.accent.withValues(alpha: 0.1),
        borderColor: Colors.transparent,
        textColor: colors.accent,
        border: 4,
        hozPadding: 4,
        vertPadding: 4,
        style: AppTextStyles.titleCardSmall(
            context: context, color: colors.accent),
      );
}
