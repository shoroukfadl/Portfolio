import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

import 'education_widget.dart';

class EducationCard extends StatefulWidget {
  final EducationEntity item;
  final int index;
  final int totalItems;

  const EducationCard({
    required this.item,
    required this.index,
    required this.totalItems,
  });

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: 8,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colors.accent25,
              child: Text(
                '🎓',
                style: AppTextStyles.extraBold32(
                  color: colors.accent,
                ),
              ),
            ),
            Container(
              width: 4,
              height: 100,
              decoration: BoxDecoration(
                  color: colors.accent25,
                  borderRadius: const BorderRadius.all(Radius.circular(2))),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.degree ?? "",
                        style: AppTextStyles.semiBold16(
                          color: colors.accent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item.university ?? "",
                        style: AppTextStyles.regular14(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.item.duration ?? "",
                  style: AppTextStyles.regular14(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              ( widget.item.gradProjectTitle ?? ""),
              style: AppTextStyles.medium16(
                color: colors.fontColor2,
              ),
            ),

            ...List.generate(widget.item.gradProjectTech.length, (i)=>Text(
              ( widget.item.gradProjectTech[i] ?? ""),
              style: AppTextStyles.medium16(
                color: colors.fontColor2,
              ),
            ),)
          ],
        ).expand,
      ],
    );
  }
}
