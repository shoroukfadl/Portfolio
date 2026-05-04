import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  const ExperienceSection({super.key, this.experiences = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return ExperienceCard(
                item: experiences[index],
                index: index,
                totalItems: experiences.length,
              );
            },
          ),
        ],
      ),
    );
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
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: colors.accent,
              width: 1,
            ),
            color: colors.accent.withValues(alpha: 0.05),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.positionTitle ?? "",
                        style: AppTextStyles.semiBold20(
                          color: colors.accent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item.companyName ?? "",
                        style:
                            AppTextStyles.semiBold14(color: colors.textPrimary),
                      ),
                      Text(
                        "${widget.item.location ?? ""}  ${ widget.item.startDate?.year.toString() ?? ""} - ${widget.item.endDate?.year.toString() ?? ""}",
                        style: AppTextStyles.medium14(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ).expand,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colors.secondary,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: colors.secondary,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      widget.item.employmentType ?? '',
                      style: AppTextStyles.medium12(
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),

              // const SizedBox(height: 12),
              // Text(
              //   widget.item.description??"",
              //   style:AppTextStyles.medium16(
              //     color:colors.textPrimary
              //   ),
              // ),
            ],
          ),
        ));
  }
}
