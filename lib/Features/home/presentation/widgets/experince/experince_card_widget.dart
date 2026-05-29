import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

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
      this.padding = Constants.desktopHozPadding,
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
          titleStyle: titleStyle,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Container(
                color: colors.text3,
                width: 0.4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: List.generate(experiences.length, (index) {
                    return ExperienceCard(
                      item: experiences[index],
                      index: index,
                      totalItems: experiences.length,
                      employeeTypeStyle: employeeTypeStyle,
                      companyNameStyle: companyNameStyle,
                      roleStyle: roleStyle,
                      dateStyle: dateStyle,
                    );
                  }),
                ),
              ),
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}
