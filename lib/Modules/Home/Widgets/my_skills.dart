

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Core/Theme/theme_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../Widgets/app_text_widget.dart';
import '../../../generated/assets.dart';

class MySkillsWidget extends StatelessWidget {
  const MySkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AppTextWidget(Strings.mySkill.translate , style: TextStyleHandler.of(context).displayTextStyleRegular48.copyWith(
            color: ThemeFactory.of(context).primary
        ),),
        32.0.heightBox ,
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
           ... List.generate(5, (i)=> SkillCardWidget()),
          ],
        )
      ],
    );
  }
}


class SkillCardWidget extends StatelessWidget {
  const SkillCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 186,
      width: 186,
      decoration: BoxDecoration(
        color: ThemeFactory.of(context).primary75,
        border: Border.all(
          color: ThemeFactory.of(context).primary,
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          SvgPicture.asset(Assets.iconsGithub , width: 56,height: 56,colorFilter: ColorFilter.mode(ThemeFactory.of(context).primary, BlendMode.srcIn),),
          16.0.heightBox ,
          Text("git" , style: TextStyleHandler.of(context).headingTextStyleBold20.copyWith(
            color: ThemeFactory.of(context).primary
          ),)
        ],
      ),
    );
  }
}
