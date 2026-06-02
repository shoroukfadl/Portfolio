import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.cardRadius),
        ),
        border: Border.all(
          color: colors.accent,
          width: 0.4,
        ),
        boxShadow:  [
          BoxShadow(
            color:
                colors.accent25.withValues(alpha: 0.1),
            blurRadius: 8,
            spreadRadius: 4,
          ),
        ]
            ,
        color: colors.surface,
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          Text(
            'Performance Testing Results',
            style: AppTextStyles.semiBold24(
              color: colors.accent,
            ),
          ),

              ...List.generate(widget.skills.length,
                  (u) => SkillCard(skill: widget.skills[u], index: u))


        ],
      ),
    );
  }
}
