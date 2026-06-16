import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'education_card.dart';

class EducationSection extends StatelessWidget {
  final EducationEntity? education;
  final double padding;
  final TextStyle? titleStyle;
  const EducationSection(
      {super.key,
      this.education,
      this.padding = Constants.desktopHozPadding,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SectionsTitleWidget(
          title: Strings.education.translate,
        ),
        EducationCard(
          item: education,
        )
      ],
    ).paddingSymmetric(vertical: 40, horizontal: padding);
  }
}
