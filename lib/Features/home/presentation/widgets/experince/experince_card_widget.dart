import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/animated_list.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        SectionsTitleWidget(
          index: 2,
          title: Strings.experience.translate,
          key: GlobalKeys.experince,
        ),
        AnimatedListView<ExperienceEntity>(
          items: experiences,
          spacing: 24,
          buildChild: (index) {
            return ExperienceCard(
              item: experiences[index],
            );
          },
        ),
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}
