import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Core/Language/locales.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'education_card.dart';

class EducationSection extends StatelessWidget {
  final List<EducationEntity> education;
  const EducationSection({super.key, this.education = const []});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      key: GlobalKeys.education,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.education.translate.toUpperCase(),
          style: AppTextStyles.medium12(color: colors.text1),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: education.length,
          itemBuilder: (context, index) {
            return EducationCard(
              item: education[index],
              index: index,
              totalItems: education.length,
            );
          },
        ),
      ],
    ).paddingOnly(start: 20);
  }
}
