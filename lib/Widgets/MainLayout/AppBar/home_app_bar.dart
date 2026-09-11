import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/appbar_helper.dart';
import 'package:portfolio/Widgets/MainLayout/Sections/menu_side_widget.dart';

class MenuSideWidget extends StatelessWidget {
  final void Function(GlobalKey key) onSectionTap;
  const MenuSideWidget({super.key, required this.onSectionTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = !context.isSmall ? 80.0 : 56.0;

    return Container(
      width: size,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8, vertical: 24),
      decoration: BoxDecoration(
          color: colors.card,
          border: Border(
              right: BorderSide(
            color: colors.border,
          ))),
      child: AnimationLimiter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 100),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 24.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              const NameAppBar(),
              SectionsWidget(onSectionTap: onSectionTap),
              const ThemeButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 400),
                    delay: const Duration(milliseconds: 100),
                    childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 24.0,
                          child: FadeInAnimation(child: widget),
                        ),
                    children: [
                      const NameAppBar(),
                      const ThemeButton(),
                    ])))
        .paddingSymmetric(vertical: 24, horizontal: mobileHozPadding);
  }
}
