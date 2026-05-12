import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  const ExperienceSection({super.key, this.experiences = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(title: Strings.experience.translate),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: experiences.length,
          separatorBuilder: (c,i)=>16.0.heightBox,
          itemBuilder: (context, index) {
            return ExperienceCard(
              item: experiences[index],
              index: index,
              totalItems: experiences.length,
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: Constants.desktopHozPadding);
  }
}

class ExperienceCard extends StatefulWidget {
  final ExperienceEntity item;
  final int index;
  final int totalItems;

  const ExperienceCard({
    super.key,
    required this.item,
    required this.index,
    required this.totalItems,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 12,
      children: [
        Container(
          width: 160,
          height: 64,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: colors.accent,
            borderRadius: BorderRadius.circular(16),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                widget.item.employmentType ?? '',
                style: AppTextStyles.medium12(
                    color: Colors.white
                ),
              ),

              Text(
                "${widget.item.location ?? ""} ",
                style: AppTextStyles.medium14(
                  color: colors.secondary,
                ),
              ),
              Text(
                "${ widget.item.startDate?.year.toString() ?? ""} - ${widget.item.endDate?.year.toString() ?? ""}",
                style: AppTextStyles.medium14(
                  color: colors.secondary,
                ),
              ),
            ],
          ),
        ),
        Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (widget.item.positionTitle ?? "") +(" | ${widget.item.companyName ?? ""}"),
                style: AppTextStyles.semiBold18(
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
  }
}
