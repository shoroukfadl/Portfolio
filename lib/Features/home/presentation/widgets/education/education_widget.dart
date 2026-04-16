import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/Custom/rounded_doted_widget.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class EducationWidget extends StatelessWidget {
  final EductionModel? item;
  final TextStyle? nameStyle, dateStyle, locationStyle, descriptionStyle;

  const EducationWidget(
      {super.key,
      this.item,
      this.nameStyle,
      this.dateStyle,
      this.locationStyle,
      this.descriptionStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.education,
          title: Strings.education.translate,
          // titleStyle: titleStyle,
          // myStyle: myStyle,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            const RoundedDotedWidget(
              padding: 4,
              innerRadius: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item?.uniName ?? "",
                  style: (nameStyle ?? AppTextStyles.labelL())
                      .copyWith(color: colors.accentCyan),
                ),
                Text(
                  item?.desc ?? "",
                  style: (descriptionStyle ?? AppTextStyles.bodyM())
                      .copyWith(color: colors.accentPurple),
                )
              ],
            ).expand,
            Text(
              item?.date ?? "",
              style: (dateStyle ?? AppTextStyles.bodyM())
                  .copyWith(color: colors.accentPurple),
            ),
          ],
        ),
      ],
    );
  }
}
