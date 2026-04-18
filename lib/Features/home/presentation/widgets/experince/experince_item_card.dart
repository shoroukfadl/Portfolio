import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';
import '../../../../../Widgets/custom_dotted_widget.dart';

class ExperienceItemCard extends StatelessWidget {
  final ExperienceModel? item;
  final bool hasNext;
  final TextStyle? nameStyle, dateStyle, locationStyle, descriptionStyle;

  const ExperienceItemCard(
      {super.key,
      this.hasNext = true,
      this.item,
      this.nameStyle,
      this.dateStyle,
      this.locationStyle,
      this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item?.companyName ?? "",
              style: (nameStyle ?? AppTextStyles.semiBold24())
                  .copyWith(color: colors.accent),
            ),
            Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.date ?? "",
                  style: (dateStyle ?? AppTextStyles.medium14())
                      .copyWith(color: colors.secondary),
                ),
                Text(
                  item?.companyLocation ?? "",
                  style: (locationStyle ?? AppTextStyles.medium14())
                      .copyWith(color: colors.secondary),
                ),
              ],
            ),
          ],
        ).expand,
        const CustomDashedLineWidget().expand,
        Text(
          item?.description ?? "",
          style: (descriptionStyle ?? AppTextStyles.regular14())
              .copyWith(color: colors.textPrimary),
        ).expand,
      ],
    );
  }
}
