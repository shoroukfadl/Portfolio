import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Modules/Home/home_controller.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/Widgets/app_text_widget.dart';
import 'package:portfolio/Widgets/custom_button_widget.dart';

import '../../Utilities/Constants/strings.dart';
import '../../generated/assets.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key,  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
   int selectedIndex =0;
   void setIndex(int index) => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        item(() {
          setIndex(0);
          Scrollable.ensureVisible(
            GlobalKeys.aboutMe.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }, selectedIndex == 0, Strings.aboutMe.translate, context),
        16.0.widthBox,
        item(() {
          setIndex(1);
          Scrollable.ensureVisible(
            GlobalKeys.skill.currentContext!,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }, selectedIndex == 1, Strings.skill.translate, context),
        16.0.widthBox,
        item(() {
          setIndex(2);
          Scrollable.ensureVisible(
            GlobalKeys.experince.currentContext!,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }, selectedIndex == 2, Strings.experience.translate, context),
        16.0.widthBox,
        item(() {
          setIndex(3);
          Scrollable.ensureVisible(
            GlobalKeys.projects.currentContext!,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,

          );
        }, selectedIndex == 3, Strings.projects.translate, context),
        16.0.widthBox,
        item(() {
          setIndex(4);
          Scrollable.ensureVisible(
            GlobalKeys.contactMe.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }, selectedIndex == 4, Strings.contactMe.translate, context),
        const Spacer(),
        CustomButtonWidget(
          onPressed: () {
            String? url = HomeController().user?.data?.cv;
            if (url != null) HelperFunctions.openUrl(url, context);
          },
          btnColor: ThemeFactory.of(context).primary,
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.resume.translate,
                style: TextStyleHandler.of(context).regular16.copyWith(
                      color: ThemeFactory.of(context).secondary300,
                    ),
              ),
              4.0.widthBox,
              SvgPicture.asset(
                Assets.iconsDownload,
                colorFilter: ColorFilter.mode(
                    ThemeFactory.of(context).secondary300, BlendMode.srcIn),
                width: 20,
                height: 20,
              )
            ],
          ),
        ),
        16.0.widthBox,
        CustomButtonWidget(
          onPressed: () {
            String gmailWebUri =
                "https://mail.google.com/mail/?view=cm&fs=1&to=${HomeController().user?.data?.email}";
            HelperFunctions.openUrl(gmailWebUri, context);
          },
          title: Strings.mail.translate,
          titleColor: ThemeFactory.of(context).primary,
          btnColor: ThemeFactory.of(context).secondary300,
        ),
      ],
    ).paddingSymmetric(vertical: 16, horizontal: 32);
  }

  Widget item(Function() onTap, bool isSelected, String title,
          BuildContext context) =>
      InkWell(
        onTap: onTap,
        child: AppTextWidget(
          title,
          style: TextStyleHandler.of(context)
              .headingTextStyleExtraBold20
              .copyWith(
                  color: ThemeFactory.of(context).primary,
                  decoration: isSelected ? TextDecoration.underline : null),
        ),
      );
}
