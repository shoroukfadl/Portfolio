import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Widgets/Portfilio/divider_widget.dart';
import '../../../../../Widgets/hover_widget.dart';
import '../../../domain/entities/experince_entity.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceEntity item;
  final int index;
  final double height;

  const ExperienceCard({
    super.key,
    this.height = 140,
    required this.item,
    required this.index,
  });

  bool get isLeft => index.isEven;
  bool get isFullWidth => (index + 1) % 3 == 0;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CardWithFloatingTitle(
        paddingHoz: !context.isSmall ? 24 : 8,
        paddingVert: 16,
        height: height,
        width: double.infinity,
        postionTop: -12,
        title: item.companyName ?? "",
        subTitle: FloatingTitle(
          title: "${item.startDate?.yyyyMM ?? ""}"
                  " - "
                  "${item.endDate?.yyyyMM ?? "Present"}" +
              " | ${item?.employmentType ?? ""}",
          backgroundColor: colors.success.withValues(alpha: 0.8),
          fontColor: Colors.white,
        ),
        child: _content(context, colors));
  }

  Widget _content(
    BuildContext context,
    AppColors colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.0.heightBox,
        Text(
          item.positionTitle ?? "",
          style: AppTextStyles.titleCard(
            context: context,
            color: colors.text1,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "${item.companyName ?? ""} | ${item.location ?? ""}",
          style: AppTextStyles.subtitleCard(
            context: context,
            color: colors.accent,
          ),
        ),
        const SizedBox(height: 12),
        ...item.description.map(
          (e) => PointText(point: e),
        ),
      ],
    );
  }
}
