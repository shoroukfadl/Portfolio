import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;

  const EducationCard({
     this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
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
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      item?.degree??"",
                      style: AppTextStyles.semiBold18(
                        color:  colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item?.fieldOfStudy??"",
                      style: AppTextStyles.medium16(
                        color: colors
                            .secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${item?.startDate?.year.toString()??""}- ${item?.endDate?.year.toString()??""}',
                    style: AppTextStyles.medium14(
                      color:colors
                          .textSecondary,
                    ),
                  ),

                  Text(
                    item?.institution??"",
                    style: AppTextStyles.medium14(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),

            ],
          ),
         Text(
           item?.description??"",
           style: AppTextStyles.regular14(
             color:colors.textSecondary,
           ),
         ),

        ],
      ),
    );
  }
}