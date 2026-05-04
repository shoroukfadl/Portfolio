import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;

  const EducationCard({
     this.item,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: colors.accent
                    .withValues(alpha:
                  0.1 ,
                ),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
            color:   colors.secondary.withValues(alpha: 0.1),
            ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.icon??"",
                    style:
                    const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          item?.degree??"",
                          style: AppTextStyles.semiBold18(
                            color:  colors.accent,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item?.fieldOfStudy??"",
                          style: AppTextStyles.semiBold14(
                            color: colors
                                .secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Expand indicator

                ],
              ),

              const SizedBox(height: 12),

              // Institution and year
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item?.institution??"",
                    style: AppTextStyles.medium14(
                      color: colors.textSecondary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color:  colors.secondary
                          .withValues(alpha:0.2),
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color:  colors.secondary
                            .withValues(alpha:0.4),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      (item?.startDate?.year?.toString()??"") + '- ${item?.endDate?.year?.toString()??""}',
                      style: AppTextStyles.medium12(
                        color:colors
                            .secondary,
                      ),
                    ),
                  ),
                ],
              ),

              // Expanded content
             Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 1,
                        color: colors.accent
                            .withValues(alpha:0.2),
                        margin: const EdgeInsets.only(
                            bottom: 16),
                      ),
                      Text(
                        item?.description??"",
                        style: AppTextStyles.regular14(
                          color:colors.textSecondary.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Wrap(
                      //   spacing: 8,
                      //   children: widget.item.gpa?.split('|').map((detail) {
                      //     return Container(
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 10,
                      //         vertical: 6,
                      //       ),
                      //       decoration: BoxDecoration(
                      //         color: colors.accent
                      //             .withValues(alpha:0.2),
                      //         borderRadius:
                      //         BorderRadius.circular(
                      //             10),
                      //       ),
                      //       child: Text(
                      //         detail.trim(),
                      //         style: AppTextStyles.medium10(
                      //           color:  colors.accent),
                      //       ),
                      //     );
                      //   }).toList()??[],
                      // ),
                    ],
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}