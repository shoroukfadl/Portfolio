import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'experince_item_card.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  final double padding;
  final TextStyle? titleStyle;
  final TextStyle? employeeTypeStyle, companyNameStyle, roleStyle, dateStyle;

  const ExperienceSection(
      {super.key,
      this.experiences = const [],
      this.padding = desktopHozPadding,
      this.titleStyle,
      this.employeeTypeStyle,
      this.companyNameStyle,
      this.roleStyle,
      this.dateStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          title: Strings.experience.translate,
          key: GlobalKeys.experince,
        ),
        Column(
          spacing: 32,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(experiences.length, (index) {
            return ExperienceCard(
              item: experiences[index],
              index: index,
            );
          }),
        )
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}
