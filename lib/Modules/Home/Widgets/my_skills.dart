import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../Core/Theme/theme_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Widgets/app_text_widget.dart';
import '../../../generated/assets.dart';

class MySkillsWidget extends StatelessWidget {
  final List<Skill> skills;

  const MySkillsWidget({super.key, this.skills = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextWidget(
          Strings.mySkill.translate,
          style: TextStyleHandler.of(context)
              .displayTextStyleRegular48
              .copyWith(color: ThemeFactory.of(context).primary),
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
  const SkillCardWidget({super.key, this.withPrim = false, this.skill});

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
            width: 56,
            height: 56,
          ),

          // colorFilter: ColorFilter.mode(withPrim ? ThemeFactory.of(context).card : ThemeFactory.of(context).primary, BlendMode.srcIn),),
          16.0.heightBox,
          Text(
            skill?.name ?? "",
            maxLines: 3,
            textAlign: TextAlign.center,
            style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(
                color: withPrim
                    ? ThemeFactory.of(context).card
                    : ThemeFactory.of(context).primary),
          )
        ],
      ),
    );
  }
}
