import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          //
          // Spacer(),
          // HomeAppBarItem(
          //
          //     onTap: () {
          //       Scrollable.ensureVisible(
          //         GlobalKeys.skill.currentContext!,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut,
          //       );
          //     },
          //     title: Strings.mySkill.translate),
          // 16.0.widthBox,
          //
          // HomeAppBarItem(
          //     onTap: () {
          //       Scrollable.ensureVisible(
          //         GlobalKeys.experince.currentContext!,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut,
          //       );
          //     },
          //     title: Strings.myExperience.translate),
          // 16.0.widthBox,
          //
          // HomeAppBarItem(
          //     onTap: () {
          //       Scrollable.ensureVisible(
          //         GlobalKeys.projects.currentContext!,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut,
          //       );
          //     },
          //     title: Strings.projects.translate),
          // 16.0.widthBox,
          //
          // HomeAppBarItem(
          //     onTap: () {
          //       Scrollable.ensureVisible(
          //         GlobalKeys.contactMe.currentContext!,
          //         duration: const Duration(seconds: 1),
          //         curve: Curves.easeInOut,
          //       );
          //     },
          //     title: Strings.contactMe.translate),

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
        ],
      ),
    );
  }
}
