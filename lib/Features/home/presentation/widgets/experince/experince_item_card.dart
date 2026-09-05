import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Custom/top_line_animated_card.dart';
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
    final maxWidth = MediaQuery.sizeOf(context).width;
    final space = context.matchedSize(large: 32, medium: 24, small: 16);
    final width = context.matchedSize(
        large: maxWidth * 2 / 3, medium: maxWidth * 3.2 / 4, small: maxWidth);

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: TopLineCardWidget(
          width: width,
          paddingHoz: space,
          paddingVert: space,
          child: (h) => _content(context, colors)),
    );
  }

  Widget _content(
    BuildContext context,
    AppColors colors,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              item.positionTitle ?? "",
              style: AppTextStyles.hc2(
                context: context,
                color: colors.text1,
              ),
            ).expand,
            date(colors, context),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          "${item.companyName ?? ""} . ${item.location ?? ""}",
          style: AppTextStyles.bl1(
            context: context,
            color: colors.text2,
          ),
        ),
        const SizedBox(height: 12),
        ...item.description.map(
          (e) => PointText(point: e),
        ),
      ],
    );
  }

  Widget date(AppColors colors, BuildContext context) => CardWithText(
        text: "${item.startDate?.yyyyMM ?? ""}"
            " - "
            "${item.endDate?.yyyyMM ?? "Present"}",
        color: colors.accent.withValues(alpha: 0.1),
        borderColor: Colors.transparent,
        textColor: colors.accent,
        border: 4,
        hozPadding: 4,
        vertPadding: 4,
        style: AppTextStyles.l3(context: context, color: colors.accent),
      );
}
