import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/date_helper.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';

class ExperinceItemCard extends StatelessWidget {
  final ExperienceEntity? item;

  const ExperinceItemCard({
    super.key,
    this.item,
  });


  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isActive = item?.status ?? false;

    return SideAnimatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item?.companyName ?? "",
                      style: AppTextStyles.titleCardLarge(context: context,
                          color: colors.secondary)),
                  const SizedBox(height: 4),
                  Text(item?.jobTitle ?? "",
                      style: AppTextStyles.label(context:context,color: colors.text1))
                ],
              ).expand,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: !isActive
                      ? colors.accent25.withOpacity(0.2)
                      : colors.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${item?.startDate == null ?"":mmYYYY(item!.startDate!)} - ${(item?.endDate == null ?"Present":mmYYYY(item!.endDate!))}",
                  style:(AppTextStyles.titleCardSmall(context: context)).copyWith(
                    color: isActive ? colors.secondary : colors.accent50,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...List.generate(
              item?.responsibilities.length ?? 0,
              (i) => Column(
                    children: [
                      PointText(
                          point: (item?.responsibilities[i] ?? ""),
                          style: AppTextStyles.body(context:context,color: colors.text2)),
                      if (i <
                          (item?.responsibilities.length ?? 0) - 1)
                        const DividerWidget(thickness: 0.6)
                    ],
                  )),
        ],
      ),
    );
  }
}
