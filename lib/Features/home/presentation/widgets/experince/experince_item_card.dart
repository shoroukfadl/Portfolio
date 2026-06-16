import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Widgets/Custom/card_with_text.dart';
import '../../../../../Widgets/Portfilio/divider_widget.dart';
import '../../../../../Widgets/hover_widget.dart';
import '../../../domain/entities/experince_entity.dart';

class ExperienceCard extends StatefulWidget {
  final ExperienceEntity item;
  final int index;
  final int totalItems;
  final TextStyle? employeeTypeStyle, companyNameStyle, roleStyle, dateStyle;

  const ExperienceCard({
    super.key,
    required this.item,
    required this.index,
    required this.totalItems,
    this.employeeTypeStyle,
    this.companyNameStyle,
    this.roleStyle,
    this.dateStyle,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return HoverWidget(builder: (hover) {
      return IntrinsicHeight(
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSize(
              duration: Duration(milliseconds: 250),
              child: VerticalGradientDivider(
                width: hover ? 8:2,
                repation: 2,
                color1: colors.accent,
                color2: colors.secondary,
              ),
            ),
            if(widget.item.endDate ==null)
            AnimatedDot(
              active: true,
            ).paddingOnly(top: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      (widget.item.positionTitle ?? ""),
                      style:
                          AppTextStyles.titleCard(
                            context: context,
                            color: colors.text1,
                          ),
                    ).expand,
                    CardWithText(
                      text:
                          "${widget.item.startDate?.yyyyMM ?? ""} - ${widget.item.endDate?.yyyyMM ?? ""}",
                      textColor: colors.text2,
                      color: colors.text3.withValues(alpha: 0.1),
                      borderColor: colors.text3,
                      border: 8,
                      vertPadding: 4,
                      style:
                          AppTextStyles.titleCardSmall(
                            context: context,
                            color: colors.text3,
                          ),
                    ),
                  ],
                ),
                Text(
                  "${widget.item.companyName ?? ""} | ${widget.item.location ?? ""}",
                  style:
                      AppTextStyles.subtitleCard(
                        context: context,
                        color: colors.secondary,
                      ),
                ),
                ...List.generate(
                  widget.item.description.length,
                  (i) => PointText(
                  point:   widget.item.description[i] ,
                  ),
                )
              ],
            ).expand,
          ],
        ),
      );
    });
  }
}
