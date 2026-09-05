import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Custom/top_line_animated_card.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;
  final bool isLast;

  const EducationCard({
    this.item,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
        large: maxWidth * 2 / 3, medium: maxWidth * 3.2 / 4, small: maxWidth);

    return TopLineCardWidget(
      width: width,
      paddingHoz: 32,
      paddingVert: 32,
      child: (h) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 4,
            children: [
              Text(
                item?.degree ?? "",
                style: AppTextStyles.hc2(
                  context: context,
                  color: colors.text1,
                ),
              ).expand,
              CardWithText(
                text: '${item?.startDate?.yyyy} - ${item?.endDate?.yyyy ?? ""}',
                color: colors.secondarySoft,
                borderColor: Colors.transparent,
                textColor: colors.secondary,
                border: 4,
                hozPadding: 4,
                vertPadding: 2,
                style:
                    AppTextStyles.l3(context: context, color: colors.secondary),
              ),
            ],
          ),
          4.0.heightBox,
          Text(
            "${item?.institution ?? ""} — ${item?.fieldOfStudy ?? ""} . GPA ${item?.gpa}/4",
            style: AppTextStyles.bl1(
              context: context,
              color: colors.text2,
            ),
          ),
          12.0.heightBox,
          ...item?.description.map((e) => PointText(point: e)) ?? [],
        ],
      ),
    );
  }
}
