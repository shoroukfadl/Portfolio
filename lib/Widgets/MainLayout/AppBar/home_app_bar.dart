import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Features/Homel/home_controller.dart';
import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Features/home/presentation/widgets/aboutMe/about_me_widget.dart';
import '../../../Utilities/Constants/strings.dart';
import 'home_app_bar_item.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [


          Spacer(),
          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.skill.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.mySkill.translate),
          16.0.widthBox,

          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.experince.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.myExperience.translate),
          16.0.widthBox,

          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.projects.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.projects.translate),
          16.0.widthBox,

          HomeAppBarItem(
              onTap: () {
                Scrollable.ensureVisible(
                  GlobalKeys.contactMe.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              title: Strings.contactMe.translate),


          // CustomButtonWidget(
          //   onPressed: () {
          //     String? url = HomeController().user?.cv;
          //     if (url != null) HelperFunctions.openUrl(url, context);
          //   },
          //   btnColor: colors.accent,
          //   width: 100,
          //   height: 40,
          //   borderRadiusValue: 12,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(Strings.resume.translate,style: AppTextStyles.bold14(color:Colors.white),),
          //       Icon(
          //         Portfolio.cv,
          //         color: Colors.white,
          //         size: 16,
          //       ),
          //     ],
          //   )
          // ),
          Spacer(),
          CustomButtonWidget.outLined(
            width: 32,
            height: 32,
            borderRadiusValue: 8,
            borderColor: colors.accent,
            onPressed: () {},
            child: Icon(
              Portfolio.theme,
              color: colors.accent,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
