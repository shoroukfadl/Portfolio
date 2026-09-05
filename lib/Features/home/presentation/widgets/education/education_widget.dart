import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';

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
      this.padding = desktopHozPadding,
      this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    return Column(
      spacing: space,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          index: 4,
          title: Strings.education.translate,
          key: GlobalKeys.education,
        ),
        CustomTimelineAnimationWidget(
            index: 0,
            child: EducationCard(
              item: education,
              isLast: true,
            ))
      ],
    ).paddingSymmetric(vertical: 40, horizontal: padding);
  }
}
