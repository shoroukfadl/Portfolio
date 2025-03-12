import 'package:flutter/material.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../Core/Theme/theme_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';

class MySkillsWidget extends StatelessWidget {
  final List<Skill> skills;
  final TextStyle? skillStyle,titleStyle,myStyle;
  final double? skillSize;
  const MySkillsWidget({super.key, this.skills = const [], this.skillStyle, this.titleStyle, this.skillSize, this.myStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionsTitleWidget(
          title: Strings.skill.translate,
          titleStyle: titleStyle,
          myStyle: myStyle,
        ),
        32.0.heightBox,
        Wrap(
          spacing: 16,
          runSpacing: 16,

          children: [
            ...List.generate(
                skills.length,
                (i) => SkillCardWidget(
                      withPrim: i % 2 == 0,
                      skill: skills[i],
                      skillSize: skillSize,
                  skillStyle: skillStyle,
                    )),
          ],
        ),
        32.0.heightBox,
      ],
    );
  }
}

class SkillCardWidget extends StatelessWidget {
  final bool withPrim;
  final Skill? skill;
  final TextStyle? skillStyle;
  final double? skillSize;
  const SkillCardWidget({super.key, this.withPrim = false, this.skill, this.skillStyle, this.skillSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      width: 186,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: withPrim
              ? ThemeFactory.of(context).primary
              : ThemeFactory.of(context).card,
          border: Border.all(
            color: ThemeFactory.of(context).primary,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RoundedImage(
            imagePath: skill?.icon ?? "",
            width: skillSize?? 56,
            height:skillSize?? 56,
          ),

          // colorFilter: ColorFilter.mode(withPrim ? ThemeFactory.of(context).card : ThemeFactory.of(context).primary, BlendMode.srcIn),),
          16.0.heightBox,
          Text(
            skill?.name ?? "",
            maxLines: 3,
            textAlign: TextAlign.center,
            style:( skillStyle?? TextStyleHandler.of(context).headingTextStyleBold20).copyWith(
                color: withPrim
                    ? ThemeFactory.of(context).card
                    : ThemeFactory.of(context).primary),
          )
        ],
      ),
    );
  }
}
