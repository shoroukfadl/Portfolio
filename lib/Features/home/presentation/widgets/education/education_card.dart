import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
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

    return AnimatedCardWidget(
      paddingHoz: 24,
      paddingVert: 20,
      width: double.infinity,
      child:(h)=> Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            spacing: 16,
            children: [
              Text(
                item?.degree ?? "",
                style: AppTextStyles.titleCard(
                  context: context,
                  color: colors.text1,
                ),
              ).expand,
              CardWithText(
                text: '${item?.startDate?.yyyy} - ${item?.endDate?.yyyy ?? ""}',
                color: colors.text3.withValues(alpha: 0.1),
                border: 8,
                borderColor: Colors.transparent,
                hozPadding: 8,
                vertPadding: 4,
                style: AppTextStyles.titleCardSmall(
                  context: context,
                  color: colors.text2,
                ),
              ),
            ],
          ),
          Row(
            spacing: 4,
            children: [
              Text(
                item?.institution ?? "",
                style: AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.accent,
                ),
              ),
              SizedBox(width:16,child: DividerWidget(thickness: 2,color: colors.accent,)),
              Text(
                item?.fieldOfStudy ?? "",
                style: AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.accent,
                ),
              ),
            ],
          ),

          Text(
            item?.description ?? "",
            style: AppTextStyles.cardBody(
              context: context,
              color: colors.text3,
            ),
          ),
        ],
      ),
    );
  }
}
