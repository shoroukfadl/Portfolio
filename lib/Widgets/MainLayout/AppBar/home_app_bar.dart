import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import 'home_app_bar_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import 'home_app_bar_item.dart';



class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context, theme) {
          return Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: CustomButtonWidget(
              width: 32,
              height: 32,
              borderRadiusValue: Constants.smallButtonRadius,
              onPressed: () {
                context.read<ThemeCubit>().changeTheme();
              },
              btnColor: colors.accent,
              child: Icon(
                theme.isDark ? Portfolio.sun:  Portfolio.moon,
                color: Colors.white,
                size: Constants.smallButtonIcon,
              ),
            ),
          );
        }
    );
  }
}

// class HomeAppBar extends StatefulWidget {
//   const HomeAppBar({super.key});
//
//   @override
//   State<HomeAppBar> createState() => _HomeAppBarState();
// }
//
// class _HomeAppBarState extends State<HomeAppBar> {
//   // bool isSectionActive(GlobalKey key) {
//   //   final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
//   //   if (box == null) return false;
//   //   final offset = box.localToGlobal(Offset.zero);
//   //   return offset.dy <= 100 && offset.dy > -box.size.height + 100;
//   // }
//   //
//   // late ScrollController _scrollController;
//   // String activeSection = "home"; // لتخزين القسم النشط
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _scrollController = ScrollController();
//   //
//   //   _scrollController.addListener(() {
//   //     if (isSectionActive(homeKey)) {
//   //       _updateActive("home");
//   //     } else if (isSectionActive(aboutKey)) {
//   //       _updateActive("about");
//   //     } else if (isSectionActive(projectsKey)) {
//   //       _updateActive("projects");
//   //     }
//   //   });
//   // }
//   //
//   // void _updateActive(String section) {
//   //   if (activeSection != section) {
//   //     setState(() => activeSection = section);
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     final colors = context.colors;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           spacing: 16,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             HomeAppBarItem(
//                 onTap: () {
//                   Scrollable.ensureVisible(
//                     GlobalKeys.aboutMe.currentContext!,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 icon: Portfolio.home
//             ),
//             HomeAppBarItem(
//                 onTap: () {
//                   Scrollable.ensureVisible(
//                     GlobalKeys.skill.currentContext!,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 icon: Portfolio.skills
//             ),
//             HomeAppBarItem(
//                 onTap: () {
//                   Scrollable.ensureVisible(
//                     GlobalKeys.education.currentContext!,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 icon: Portfolio.edu
//
//             ),
//             HomeAppBarItem(
//                 onTap: () {
//                   Scrollable.ensureVisible(
//                     GlobalKeys.experince.currentContext!,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 icon: Portfolio.work
//             ),
//             HomeAppBarItem(
//                 onTap: () {
//                   Scrollable.ensureVisible(
//                     GlobalKeys.projects.currentContext!,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 icon: Portfolio.projects
//             ),
//             HomeAppBarItem(
//                 onTap: () {
//                   Scrollable.ensureVisible(
//                     GlobalKeys.contactMe.currentContext!,
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.easeInOut,
//                   );
//                 },
//                 icon: Portfolio.link
//             ),
//
//
//
//
//           ],
//         ),
//
//         BlocBuilder<ThemeCubit,ThemeState>(
//             builder: (context, theme) {
//               return CustomButtonWidget(
//                 width: 32,
//                 height: 32,
//                 borderRadiusValue: 8,
//                 onPressed: () {
//                   context.read<ThemeCubit>().changeTheme();
//                 },
//                 btnColor: colors.accent2,
//                 child: Icon(
//                   theme.isDark ? Portfolio.sun:  Portfolio.moon,
//                   color: Colors.white,
//                   size: 16,
//                 ),
//               );
//             }
//         ),
//       ],
//     );
//   }
// }
