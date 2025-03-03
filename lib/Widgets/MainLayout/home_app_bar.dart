import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocklis/Core/Theme/theme_model.dart';
import 'package:rocklis/Utilities/extensions.dart';
import 'package:rocklis/Utilities/text_style_helper.dart';
import 'package:rocklis/Widgets/app_text_widget.dart';
import 'package:rocklis/Widgets/custom_button_widget.dart';

import '../../Utilities/Constants/strings.dart';
import '../../generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      spacing: 16,
      children: [
        AppTextWidget(Strings.aboutMe.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        AppTextWidget(Strings.skill.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        AppTextWidget(Strings.projects.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        AppTextWidget(Strings.contactMe.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        const Spacer(),

        CustomButtonWidget(
          onPressed: (){},
          btnColor: ThemeFactory.of(context).primary,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Strings.resume.translate, style: TextStyleHandler.of(context)
                  .regular16.copyWith(color:  ThemeFactory.of(context).secondary300,),),
              SvgPicture.asset(Assets.iconsDownload,width: 20,height: 20,)
            ],
          ),
        ),


        CustomButtonWidget(
          onPressed: (){},
          title: Strings.mail.translate,
          titleColor: ThemeFactory.of(context).primary,
          btnColor: ThemeFactory.of(context).secondary300,
        ),
      ],
    ).paddingSymmetric(vertical: 16 , horizontal: 32);
  }
}
