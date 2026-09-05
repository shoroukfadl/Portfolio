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
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    return Column(
      spacing: space,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          index: 2,
          title: Strings.experience.translate,
          key: GlobalKeys.experince,
        ),
        Column(
          children: List.generate(
            experiences.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == experiences.length - 1 ? 0 : 24,
              ),
              child: CustomTimelineAnimationWidget(
                key: ValueKey('experience-$index'),
                index: index,
                child: ExperienceCard(
                  item: experiences[index],
                ),
              ),
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}
