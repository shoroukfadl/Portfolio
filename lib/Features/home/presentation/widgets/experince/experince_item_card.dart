import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Widgets/Portfilio/divider_widget.dart';
import '../../../../../Widgets/hover_widget.dart';
import '../../../domain/entities/experince_entity.dart';

class ExperienceCard extends StatelessWidget {
  final ExperienceEntity item;
  final int index;

  const ExperienceCard({
    super.key,
    required this.item,
    required this.index,
  });

  bool get isLeft => index.isEven;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return HoverWidget(
      builder: (hover) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child:
                  isLeft ? _date(context, colors) : _content(context, colors),
            ),
            _timeline(colors, hover),
            Expanded(
              flex: 4,
              child:
                  isLeft ? _content(context, colors) : _date(context, colors),
            ),
          ],
        );
      },
    );
  }

  Widget _timeline(AppColors colors, bool hover) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          const AnimatedDot(active: true),
          const SizedBox(height: 12),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            width: hover ? 4 : 2,
            child: VerticalGradientDivider(
              repation: 2,
              height: 80,
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              color1: colors.accent,
              color2: colors.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _date(
    BuildContext context,
    AppColors colors,
  ) {
    return Align(
      alignment: isLeft ? Alignment.topRight : Alignment.topLeft,
      child: Text(
        "${item.startDate?.yyyyMM ?? ""}"
        " - "
        "${item.endDate?.yyyyMM ?? "Present"}",
        style: AppTextStyles.subtitleCard(
          context: context,
          color: colors.text2,
        ),
      ),
    );
  }

  Widget _content(
    BuildContext context,
    AppColors colors,
  ) {
    return Column(
      crossAxisAlignment:
          isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
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
