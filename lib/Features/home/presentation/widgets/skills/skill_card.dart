
import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';

class SkillCard extends StatelessWidget {
  final SkillEntity skill;
  final int index;
  final double radius;
  final Color color;
  const SkillCard({
    super.key,
    required this.skill,
    required this.index,
     this.radius=16,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;




    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: color.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              skill.category??"",
              style: AppTextStyles.medium12(
                color: colors.fontColor1,

              )),


            Wrap(
              children: [
                Text(
                 skill?.skillName??"",
                  style: AppTextStyles.medium12(
                    color: colors.fontColor1,

                  ),
                ),
              ],
            )



          ],
        ),
      ),
    );
  }
}
