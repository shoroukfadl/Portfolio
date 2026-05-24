import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Widgets/Custom/card_with_text.dart';
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
      return Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: colors.accent,
            radius: 6,
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
                    style: widget.roleStyle ??
                        AppTextStyles.semiBold16(
                          color: colors.text1,
                        ),
                  ).expand,
                  CardWithText(
                    text:
                    "${widget.item.startDate?.yyyyMM??""} - ${widget.item.endDate?.yyyyMM ?? ""}",
                    textColor: colors.secondaryEv,
                    color: colors.accent2.withValues(alpha: 0.2),
                    borderColor: colors.accent2.withValues(alpha: 0.2),
                    style: widget.dateStyle ??
                        AppTextStyles.regular12(
                          color: colors.secondaryEv,
                        ),
                  ),
                ],
              ),
              Text(
                "${widget.item.companyName ?? ""} | ${widget.item.location ?? ""}",
                style: widget.roleStyle ??
                    AppTextStyles.regular12(
                      color: colors.text2,
                    ),
              ),
              ...List.generate(widget.item.description.length, (i)=> Text(
                widget.item.description[i] ?? "",
                style: widget.roleStyle ??
                    AppTextStyles.regular14(
                      color: colors.text3,
                    ),
              ),)
            ],
          ).expand,
        ],
      );
    });
  }
}
