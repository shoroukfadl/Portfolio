import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity item;
  final int index;
  final int totalItems;

  const EducationCard({
    required this.item,
    required this.index,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
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
                        item.degree ?? "",
                        style: AppTextStyles.semiBold16(
                          color: colors.accent,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.university ?? "",
                        style: AppTextStyles.regular14(
                          color: colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  item.duration ?? "",
                  style: AppTextStyles.regular14(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              (item.gradProjectTitle ?? ""),
              style: AppTextStyles.medium16(
                color: colors.secondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Grade: ${item.grade ?? ""}',
              style: AppTextStyles.medium16(
                color: colors.secondary,
              ),
            ),
            const SizedBox(height: 12),


            Wrap(
              spacing: 8,
              runSpacing: 16,
              children: [
                ...List.generate(
                  item.gradProjectTech.length,
                      (i) => Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      color: colors.accent25.withValues(alpha: 0.4),
                    ),
                    child: Text(
                      (item.gradProjectTech[i] ?? ""),
                      style: AppTextStyles.medium16(
                        color: colors.fontColor2,
                      ),
                    ),
                  ),
                )
              ],
            )

          ],
        ).expand,
      ],
    );
  }
}
