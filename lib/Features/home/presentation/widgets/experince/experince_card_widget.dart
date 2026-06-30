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
  final double padding, height;
  final TextStyle? titleStyle;
  final TextStyle? employeeTypeStyle, companyNameStyle, roleStyle, dateStyle;

  const ExperienceSection(
      {super.key,
      this.experiences = const [],
      this.padding = desktopHozPadding,
      this.titleStyle,
      this.employeeTypeStyle,
      this.companyNameStyle,
      this.height = 160,
      this.roleStyle,
      this.dateStyle});

  List<List<int>> _buildExperienceRows(int length) {
    final rows = <List<int>>[];
    int i = 0;
    while (i < length) {
      final position = i + 1;
      if (position % 3 == 0) {
        rows.add([i]);
        i += 1;
      } else {
        if (i + 1 < length) {
          rows.add([i, i + 1]);
          i += 2;
        } else {
          rows.add([i]);
          i += 1;
        }
      }
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final experienceRows = _buildExperienceRows(experiences.length);

    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          title: Strings.experience.translate,
          key: GlobalKeys.experince,
        ),
        if (context.isSmall)
          ...experienceRows.map((group) {
            if (group.length == 1) {
              final i = group.first;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ExperienceCard(
                  item: experiences[i],
                  height: height,
                  index: i,
                ),
              );
            } else {
              return Column(
                spacing: 20,
                children: group
                    .map(
                      (i) => ExperienceCard(
                        item: experiences[i],
                        height: height,
                        index: i,
                      ),
                    )
                    .toList(),
              );
            }
          }).toList()
        else
          ...experienceRows.map((group) {
            if (group.length == 1) {
              final i = group.first;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ExperienceCard(
                  item: experiences[i],
                  height: height,
                  index: i,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  spacing: 16,
                  children: group
                      .map(
                        (i) => ExperienceCard(
                          item: experiences[i],
                          height: height,
                          index: i,
                        ).expand,
                      )
                      .toList(),
                ),
              );
            }
          }).toList()
      ],
    ).paddingSymmetric(horizontal: padding);
  }
}
