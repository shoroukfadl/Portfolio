import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/strings.dart';
class SkillsSection extends StatelessWidget {
  final TechnicalSkillEntity? skills;
  const SkillsSection({super.key, this.skills});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            Strings.skill.translate,
            style: AppTextStyles.extraBold40(color: colors.accent),
          ),
          ShaderMask(
            shaderCallback: (bounds) =>
                LinearGradient(colors: [colors.accent, colors.secondary])
                    .createShader(bounds),
            child:Container(height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100)
              ),
            )
          ),
          const SizedBox(height: 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 4 : 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 2,
            ),
            itemCount: skills?.skills.length,
            itemBuilder: (context, index) {
              return SkillCard(skill: skills?.skills[index], index: index);
            },
          ),
        ],
      ),
    );
  }
}
