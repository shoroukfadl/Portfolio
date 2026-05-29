import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;

  const EducationCard({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedCardWidget(
      paddingHoz: 24,
      paddingVert: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colors.accentSoft,
                    border: Border.all(color: colors.accent)),
                child: Icon(
                  Portfolio.edu,
                  size: 24,
                  color: colors.accent,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  spacing: 6,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item?.degree ?? "",
                      style: AppTextStyles.medium16(
                        color: colors.text1,
                      ),
                    ),
                    Text(
                      "${item?.institution ?? ""} - ${item?.fieldOfStudy ?? ""} ",
                      style: AppTextStyles.regular12(
                        color: colors.text2,
                      ),
                    ),
                  ],
                ),
              ),
              CardWithText(
                text: '${item?.startDate?.yyyy} - ${item?.endDate?.yyyy ?? ""}',
                color: colors.accentSoft,
                borderColor: colors.accentSoft,
                hozPadding: 8,
                vertPadding: 4,
                style: AppTextStyles.medium10(
                  color: colors.text2,
                ),
              ),
            ],
          ),
          Text(
            item?.description ?? "",
            style: AppTextStyles.regular12(
              color: colors.text3,
            ),
          ),
        ],
      ),
    );
  }
}
