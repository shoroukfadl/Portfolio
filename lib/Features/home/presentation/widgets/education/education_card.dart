import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;

  const EducationCard({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CardWithFloatingTitle(
      paddingHoz: !context.isSmall ? 24 : 8,
      paddingVert: 16,
      width: double.infinity,
      postionTop: -12,
      title: item?.degree ?? "",
      subTitle: FloatingTitle(
        title: '${item?.startDate?.yyyy} - ${item?.endDate?.yyyy ?? ""}',
        backgroundColor: colors.success.withValues(alpha: 0.8),
        fontColor: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 4,
            children: [
              Text(
                item?.institution ?? "",
                style: AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.text1,
                ),
              ),
              VerticalGradientDivider(
                color1: colors.accent,
                width: 8,
                height: 2,
                color2: colors.secondary,
                repation: 2,
              ),
              Text(
                item?.fieldOfStudy ?? "",
                maxLines: 2,
                style: AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.text1,
                ),
              ).expand,
            ],
          ),
          8.0.heightBox,
          CardWithText(
            text: '✨ GPA : ${item?.gpa}/4 ',
            borderColor: colors.accent,
            color: Colors.transparent,
            hozPadding: 12,
            vertPadding: 6,
            borderWidth: 0.2,
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: colors.accent,
            ),
          ),
          8.0.heightBox,
          Text(
            item?.description ?? "",
            style: AppTextStyles.cardBody(
              context: context,
              color: colors.text2,
            ),
          ),
        ],
      ),
    );
  }
}
