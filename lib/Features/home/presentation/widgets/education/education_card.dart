import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;

  const EducationCard({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CardWithTitle(
      paddingHoz: !context.isSmall ? 24 : 8,
      paddingVert: 16,
      width: double.infinity,
      cardColor: colors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item?.degree ?? "",
            style: AppTextStyles.titleCard2(
              context: context,
              color: colors.text1,
            ),
          ),
          Row(
            spacing: 4,
            children: [
              Text(
                "${item?.institution ?? ""} — ${item?.fieldOfStudy ?? ""}",
                style: AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.text3,
                ),
              ).expand,
              CardWithText(
                text: '${item?.startDate?.yyyy} - ${item?.endDate?.yyyy ?? ""}',
                color: colors.accent.withValues(alpha: 0.1),
                borderColor: Colors.transparent,
                textColor: colors.accent,
                border: 4,
                hozPadding: 4,
                vertPadding: 2,
                style: AppTextStyles.titleCardSmall(
                    context: context, color: colors.accent),
              ),
            ],
          ),
          8.0.heightBox,
          CardWithText(
            text: '✨ GPA : ${item?.gpa}/4 ',
            color: colors.secondary.withValues(alpha: 0.1),
            borderColor: Colors.transparent,
            hozPadding: 4,
            vertPadding: 4,
            border: 4,
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: colors.secondary,
            ),
          ),
          8.0.heightBox,
          Text(
            item?.description ?? "",
            style: AppTextStyles.cardBodyL(
              context: context,
              color: colors.text2,
            ),
          ),
        ],
      ),
    );
  }
}
