import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocklis/Core/Theme/theme_model.dart';
import 'package:rocklis/Utilities/extensions.dart';
import 'package:rocklis/Utilities/shared_preferences.dart';
import 'package:rocklis/Widgets/tooltip_widget.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import '../../Core/Language/app_languages.dart';
import '../../Utilities/Constants/global_keys.dart';
import '../../Utilities/text_style_helper.dart';
import '../app_text_widget.dart';
import '../hover_widget.dart';

class CustomDrawer extends StatefulWidget {
  final String? currentPath;
  const CustomDrawer({super.key, this.currentPath});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  bool isMedicalTreatmentOpened = false;

  late bool isMenuExpanded;
  late double drawerWidth;

  @override
  void initState() {
    super.initState();
    isMenuExpanded = SharedPref.getMenuMode();
  }

  void changeDrawerWidth() {
    setState(() {
      isMenuExpanded = !isMenuExpanded;
      SharedPref.setMenuMode(isMenuExpanded);
      drawerWidth = getDrawerWidth(context);
    });
  }

  double getDrawerWidth(BuildContext context) {
    if (isMenuExpanded) {
      return context.isSmall ? 0.5.sw : 0.285.sw;
    } else {
      return context.isSmall ? 0.15.sw : 0.1.sw;
    }
  }

  @override
  Widget build(BuildContext context) {
    drawerWidth = getDrawerWidth(context);
    return SizedBox(
      width: drawerWidth,
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Drawer(
              width: drawerWidth - 16,
              backgroundColor: ThemeFactory.of(context).backgroundColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(8),
                      bottomStart: Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Align(
                      alignment: isMenuExpanded
                          ? AlignmentDirectional.topStart
                          : AlignmentDirectional.center,
                      child: Icon(
                        Icons.close,
                        color: ThemeFactory.of(context).primary,
                        size: context.isSmall ? 24 : 32,
                      ),
                    ),
                    onTap: () {
                      GlobalKeys.scaffoldKey.currentState!.closeEndDrawer();
                    },
                  ),
                  24.0.heightBox,

                ],
              ).paddingSymmetric(
                  horizontal: isMenuExpanded
                      ? 16
                      : context.isMedium
                          ? 12
                          : 0,
                  vertical: 16),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: HoverWidget(
              builder: (isHovered) {
                return InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    changeDrawerWidth();
                  },
                  child: Container(
                    // padding: const EdgeInsets.all(16),
                    height: context.isSmall ? 32 : 40,
                    width: context.isSmall ? 32 : 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeFactory.of(context).primary,
                    ),
                    child: Center(
                        child: Transform.rotate(
                      angle: isMenuExpanded ? 0 : pi,
                      child: SvgPicture.asset(
                        "",
                        // appLangIsArabic()
                        //     ? Assets.iconsArrowRight
                        //     : Assets.iconsArrowLeft,
                        width: context.isSmall ? 16 : 24,
                        height: context.isSmall ? 16 : 24,
                        colorFilter: ColorFilter.mode(
                            ThemeFactory.of(context).fontWhite,
                            BlendMode.srcIn),
                      ),
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LargeDrawerItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final bool isSelected;
  final Function() onTap;
  final bool isMenuExpanded;
  const LargeDrawerItemWidget(
      {super.key,
      required this.title,
      required this.iconPath,
      required this.isSelected,
      required this.onTap,
      required this.isMenuExpanded});

  @override
  Widget build(BuildContext context) {
    return isMenuExpanded
        ? InkWell(
            onTap: onTap,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            borderRadius: isMenuExpanded ? null : BorderRadius.circular(40),
            child: Container(
              padding: EdgeInsets.all(context.isSmall
                  ? 4
                  : context.isMedium
                      ? 6
                      : 16),
              decoration: BoxDecoration(
                shape: isMenuExpanded ? BoxShape.rectangle : BoxShape.circle,
                color: !isSelected
                    ? Colors.transparent
                    : ThemeFactory.of(context).primary,
              ),
              child: isMenuExpanded
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          iconPath,
                          width: context.isSmall ? 24 : 32,
                          height: context.isSmall ? 24 : 32,
                          colorFilter: ColorFilter.mode(
                              isSelected
                                  ? ThemeFactory.of(context).fontWhite
                                  : ThemeFactory.of(context).primary,
                              BlendMode.srcIn),
                        ),
                        8.0.widthBox,
                        AppTextWidget(
                          title,
                          style: TextStyleHelper.of(context)
                              .semiBold12
                              .copyWith(
                                  color: isSelected
                                      ? ThemeFactory.of(context).fontWhite
                                      : ThemeFactory.of(context).primary,
                                  fontSize: context.isSmall ? 12 : 16),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "",
                          width: context.isSmall ? 24 : 32,
                          height: context.isSmall ? 24 : 32,
                          colorFilter: ColorFilter.mode(
                              isSelected
                                  ? ThemeFactory.of(context).fontWhite
                                  : ThemeFactory.of(context).primary,
                              BlendMode.srcIn),
                        ),
                      ],
                    )
                  : Center(
                      child: SvgPicture.asset(
                        iconPath,
                        width: context.isSmall ? 24 : 32,
                        height: context.isSmall ? 24 : 32,
                        colorFilter: ColorFilter.mode(
                            isSelected
                                ? ThemeFactory.of(context).fontWhite
                                : ThemeFactory.of(context).primary,
                            BlendMode.srcIn),
                      ),
                    ),
            ),
          )
        : TooltipWidget(
            toolTipTitle: title,
            toolTipPosition: appLangIsArabic(context: context)
                ? TooltipDirection.right
                : TooltipDirection.left,
            child: InkWell(
              onTap: onTap,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              borderRadius: isMenuExpanded ? null : BorderRadius.circular(40),
              child: Container(
                padding: EdgeInsets.all(context.isSmall
                    ? 4
                    : context.isMedium
                        ? 6
                        : 16),
                decoration: BoxDecoration(
                  shape: isMenuExpanded ? BoxShape.rectangle : BoxShape.circle,
                  color: !isSelected
                      ? Colors.transparent
                      : ThemeFactory.of(context).primary,
                ),
                child: isMenuExpanded
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            iconPath,
                            width: context.isSmall ? 24 : 32,
                            height: context.isSmall ? 24 : 32,
                            colorFilter: ColorFilter.mode(
                                isSelected
                                    ? ThemeFactory.of(context).fontWhite
                                    : ThemeFactory.of(context).primary,
                                BlendMode.srcIn),
                          ),
                          8.0.widthBox,
                          AppTextWidget(
                            title,
                            style: TextStyleHelper.of(context)
                                .semiBold12
                                .copyWith(
                                    color: isSelected
                                        ? ThemeFactory.of(context).fontWhite
                                        : ThemeFactory.of(context).primary,
                                    fontSize: context.isSmall ? 12 : 16),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "",

                            width: context.isSmall ? 24 : 32,
                            height: context.isSmall ? 24 : 32,
                            colorFilter: ColorFilter.mode(
                                isSelected
                                    ? ThemeFactory.of(context).fontWhite
                                    : ThemeFactory.of(context).primary,
                                BlendMode.srcIn),
                          ),
                        ],
                      )
                    : Center(
                        child: SvgPicture.asset(
                          iconPath,
                          width: context.isSmall ? 24 : 32,
                          height: context.isSmall ? 24 : 32,
                          colorFilter: ColorFilter.mode(
                              isSelected
                                  ? ThemeFactory.of(context).fontWhite
                                  : ThemeFactory.of(context).primary,
                              BlendMode.srcIn),
                        ),
                      ),
              ),
            ),
          );
  }
}
