import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class SkillsSection extends StatelessWidget {
  final List<TechnicalSkillEntity> skills;
  final double padding;
  final TextStyle? titleStyle;
  final TextStyle? nameStyle, contentStyle;
  final double iconSize;
  const SkillsSection(
      {super.key,
      this.skills = const [],
      this.iconSize = 40,
      this.padding = Constants.desktopHozPadding,
      this.titleStyle,
      this.nameStyle,
      this.contentStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        spacing: 16,
        children: [
          SectionsTitleWidget(
            title: Strings.skill.translate,
            titleStyle: titleStyle,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isLarge
                  ? 4
                  : context.isMedium
                      ? 2
                      : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: context.isMedium ? 1.5 : 2.1,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillCard(
                skill: skills[index],
                index: index,
                iconSize: iconSize,
                nameStyle: nameStyle,
                contentStyle: contentStyle,
              );
            },
          ),
        ],
      ),
    );
  }
}
