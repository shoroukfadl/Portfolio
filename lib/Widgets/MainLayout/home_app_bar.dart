import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Modules/Home/home_controller.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/Widgets/app_text_widget.dart';
import 'package:portfolio/Widgets/custom_button_widget.dart';

import '../../Utilities/Constants/strings.dart';
import '../../generated/assets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        AppTextWidget(Strings.aboutMe.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),

        16.0.widthBox,
        AppTextWidget(Strings.skill.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        16.0.widthBox,
        AppTextWidget(Strings.projects.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        16.0.widthBox,
        AppTextWidget(Strings.contactMe.translate , style: TextStyleHandler.of(context).headingTextStyleExtraBold20.copyWith(
          color: ThemeFactory.of(context).primary, decoration: TextDecoration.underline
        ),),
        const Spacer(),

        CustomButtonWidget(
          onPressed: (){

            String? url = HomeController().user?.data?.cv;
            if(url != null) HelperFunctions.openUrl(url, context);

          },
          btnColor: ThemeFactory.of(context).primary,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Strings.resume.translate, style: TextStyleHandler.of(context)
                  .regular16.copyWith(color:  ThemeFactory.of(context).secondary300,),),
              4.0.widthBox,
              SvgPicture.asset(Assets.iconsDownload,colorFilter: ColorFilter.mode( ThemeFactory.of(context).secondary300, BlendMode.srcIn),width: 20,height: 20,)
            ],
          ),
        ),

  16.0.widthBox,
        CustomButtonWidget(
          onPressed: (){
             String gmailWebUri = "https://mail.google.com/mail/?view=cm&fs=1&to=${HomeController().user?.data?.email}";
            HelperFunctions.openUrl(gmailWebUri, context);
          },
          title: Strings.mail.translate,
          titleColor: ThemeFactory.of(context).primary,
          btnColor: ThemeFactory.of(context).secondary300,
        ),
      ],
    ).paddingSymmetric(vertical: 16 , horizontal: 32);
  }
}
