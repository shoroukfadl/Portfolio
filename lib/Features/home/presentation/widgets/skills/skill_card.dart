import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider_widget.dart';

class SkillCard extends StatelessWidget {
  final TechnicalSkillEntity skill;
  final bool isLast;

  const SkillCard({
    super.key,
    required this.skill,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(spacing: 0, children: [
            Text(
              skill.category ?? "",
              style: AppTextStyles.hc1(context: context, color: colors.text1),
            )
                .paddingSymmetric(vertical: 16, horizontal: 16)
                .expandFlex(context.isLarge ? 1 : 2),
            VerticalDividerWidget(
              color: colors.border,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...List.generate(skill.skills.length, (i) {
                  final activeColor = colors.accentSoft;
                  return AnimatedCardWithText(
                    text: (skill.skills[i].skillName ?? ""),
                    hozPadding: 8,
                    vertPadding: 8,
                    maxLine: 3,
                    border: 4,
                    borderWidth: 0.2,
                    color: activeColor,
                    borderColor: activeColor,
                    textColor: colors.text1,
                  );
                })
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16).expandFlex(4)
          ]),
        ),
        if (!isLast) DividerWidget(),
      ],
    );
    // return CardWithTitle(
    //     width: double.infinity,
    //     cardColor: colors.card,
    //     borderColor: colors.border,
    //     paddingHoz: 16,
    //     paddingVert: 8,
    //     child: Column(
    //       spacing: 8,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           skill.category ?? "",
    //           style: AppTextStyles.hc1(context: context, color: colors.text1),
    //         ),
    //         Wrap(
    //           spacing: 8,
    //           runSpacing: 8,
    //           children: [
    //             ...List.generate(skill.skills.length, (i) {
    //               final activeColor = i == 0 || i == (skill.skills.length - 1)
    //                   ? colors.accentSoft
    //                   : colors.text2;
    //               return CardWithText(
    //                 text: (skill.skills[i].skillName ?? ""),
    //                 hozPadding: 8,
    //                 vertPadding: 4,
    //                 maxLine: 3,
    //                 border: 4,
    //                 borderWidth: 0.2,
    //                 color: activeColor.withValues(alpha: 0.05),
    //                 borderColor: activeColor.withValues(alpha: 0.5),
    //                 textColor: activeColor,
    //               );
    //             })
    //           ],
    //         ).expand
    //       ],
    //     ));
  }
}
