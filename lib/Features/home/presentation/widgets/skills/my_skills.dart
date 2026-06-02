import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/strings.dart';

class SkillsSection extends StatefulWidget {
  final List<TechnicalSkillEntity> skills;
  final double shieldSize, orbitRadius;
  const SkillsSection(
      {super.key,
      this.skills = const [],
      this.orbitRadius = 160,
      this.shieldSize = 160});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        SectionsTitleWidget(title: Strings.skill.translate.toUpperCase(),),

            Wrap(
              spacing: 24,
              runSpacing: 16,
              children: [
                ...List.generate(widget.skills.length, (u) => SkillCard(skill: widget.skills[u], index: u))
              ],
            )


      ],
    );
  }
}
