import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/hover_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  final double padding;
  final TextStyle? titleStyle;
  final TextStyle? employeeTypeStyle, companyNameStyle, roleStyle, dateStyle;

  const ExperienceSection(
      {super.key,
      this.experiences = const [],
      this.padding = Constants.desktopHozPadding,
      this.titleStyle,
      this.employeeTypeStyle,
      this.companyNameStyle,
      this.roleStyle,
      this.dateStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          title: Strings.experience.translate,
          titleStyle: titleStyle,
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experiences.length,
          separatorBuilder: (c, i) => 16.0.heightBox,
          itemBuilder: (context, index) {
            return ExperienceCard(
              item: experiences[index],
              index: index,
              totalItems: experiences.length,
              employeeTypeStyle: employeeTypeStyle,
              companyNameStyle: companyNameStyle,
              roleStyle: roleStyle,
              dateStyle: dateStyle,
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}

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
        spacing: 12,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 160,
            height: 64,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: colors.accent,
              boxShadow: hover
                  ? [
                      BoxShadow(
                        color: colors.accent,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
              borderRadius: hover
                  ? const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(0),
                      bottomEnd: Radius.circular(0),
                      topStart: Radius.circular(16),
                      bottomStart: Radius.circular(16),
                    )
                  : BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  widget.item.employmentType ?? '',
                  style: widget.employeeTypeStyle ??
                      AppTextStyles.medium12(color: Colors.white),
                ),
                Text(
                  "${widget.item.location ?? ""} ",
                  style: widget.dateStyle ??
                      AppTextStyles.medium14(
                        color: colors.secondary,
                      ),
                ),
                Text(
                  "${widget.item.startDate?.year.toString() ?? ""} - ${widget.item.endDate?.year.toString() ?? ""}",
                  style: widget.dateStyle ??
                      AppTextStyles.medium14(
                        color: colors.secondary,
                      ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
              boxShadow: hover
                  ? [
                BoxShadow(
                  color: colors.accent,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ]
                  : null,
              borderRadius: hover
                  ? const BorderRadiusDirectional.only(
                      topEnd: Radius.circular(16),
                      bottomEnd: Radius.circular(16),
                      topStart: Radius.circular(0),
                      bottomStart: Radius.circular(0),
                    )
                  : BorderRadius.circular(16),
              border: Border.all(
                color: colors.surface,
                width: 1,
              ),
              color: colors.surfaceElevated,
            ),
            height: 64,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (widget.item.positionTitle ?? "") +
                      (" | ${widget.item.companyName ?? ""}"),
                  style: widget.roleStyle ??
                      AppTextStyles.semiBold18(
                        color: colors.textPrimary,
                      ),
                ),
                const SizedBox(height: 4),

                // Text(
                //   widget.item.description??"",
                //   style:AppTextStyles.medium16(
                //     color:colors.textPrimary
                //   ),
                // ),
              ],
            ),
          ).expand,
        ],
      );
    });
  }
}
