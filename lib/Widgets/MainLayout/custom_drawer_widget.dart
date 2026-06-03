import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/shared_preferences.dart';
import 'package:portfolio/Widgets/tooltip_widget.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

import '../../Core/Language/app_languages.dart';
import '../../Utilities/Constants/global_keys.dart';
import '../../Utilities/Constants/strings.dart';
import '../Buttons/custom_button_widget.dart';
import '../Inputs/app_text_widget.dart';

class CustomDrawer extends StatefulWidget {
  final String? currentPath;
  final int? currentIndex;

  const CustomDrawer({super.key, this.currentPath, this.currentIndex});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late bool isMenuExpanded;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    isMenuExpanded = SharedPref.getMenuMode();
    selectedIndex = widget.currentIndex ?? 0;
  }

  void changeDrawerWidth() {
    setState(() {
      isMenuExpanded = !isMenuExpanded;
      SharedPref.setMenuMode(isMenuExpanded);
    });
  }

  void setIndex(int index) => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Drawer(
      width: 0.4,
      backgroundColor: colors.background,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(8), bottomStart: Radius.circular(8))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(40),
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Icon(
                Icons.close,
                color: colors.accent,
                size: context.isSmall ? 24 : 32,
              ),
            ),
            onTap: () {
              GlobalKeys.scaffoldKey.currentState!.closeEndDrawer();
            },
          ),
          24.0.heightBox,
          item(() {
            setIndex(0);
            Scrollable.ensureVisible(
              GlobalKeys.aboutMe.currentContext!,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }, selectedIndex == 0, Strings.aboutMe.translate, context),
          16.0.heightBox,
          item(() {
            setIndex(1);
            Scrollable.ensureVisible(
              GlobalKeys.skill.currentContext!,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }, selectedIndex == 1, Strings.skill.translate, context),
          16.0.heightBox,
          item(() {
            setIndex(2);
            Scrollable.ensureVisible(
              GlobalKeys.experince.currentContext!,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }, selectedIndex == 2, Strings.experience.translate, context),
          16.0.heightBox,
          item(() {
            setIndex(3);
            Scrollable.ensureVisible(
              GlobalKeys.projects.currentContext!,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          }, selectedIndex == 3, Strings.projects.translate, context),
          16.0.heightBox,
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
              // String? url = HomeController().user?.cv;
              // if (url != null) HelperFunctions.openUrl(url, context);
            },
            btnColor: colors.accent,
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.resume.translate,
                  style: AppTextStyles.regular14().copyWith(
                    color: colors.accent25,
                  ),
                ),
                4.0.widthBox,
                // SvgPicture.asset(
                //   Assets.iconsDownload,
                //   colorFilter: ColorFilter.mode(
                //       colors.accent25, BlendMode.srcIn),
                //   width: 16,
                //   height: 16,
                // )
              ],
            ),
          ),
          16.0.heightBox,
          CustomButtonWidget(
            onPressed: () {
              // String gmailWebUri =
              //     "https://mail.google.com/mail/?view=cm&fs=1&to=${HomeController().user?.email}";
              // HelperFunctions.openUrl(gmailWebUri, context);
            },
            child: Text(
              Strings.mail.translate,
              style: AppTextStyles.regular14().copyWith(
                color: colors.accent,
              ),
            ),
            btnColor: colors.accent25,
          ),
        ],
      ).paddingSymmetric(horizontal: 16, vertical: 16),
    );
  }

  Widget item(
      Function() onTap, bool isSelected, String title, BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      child: AppTextWidget(
        title,
        style: AppTextStyles.regular16().copyWith(
            color: colors.accent,
            decoration: isSelected ? TextDecoration.underline : null),
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
    final colors = context.colors;

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
                color: !isSelected ? Colors.transparent : colors.accent,
              ),
              child: isMenuExpanded
                  ? Row(
                      children: [
                        SvgPicture.asset(
                          iconPath,
                          width: context.isSmall ? 24 : 32,
                          height: context.isSmall ? 24 : 32,
                          colorFilter: ColorFilter.mode(
                              isSelected ? colors.text2 : colors.accent,
                              BlendMode.srcIn),
                        ),
                        8.0.widthBox,
                        AppTextWidget(
                          title,
                          style: AppTextStyles.regular14().copyWith(
                              color: isSelected ? colors.text2 : colors.accent,
                              fontSize: context.isSmall ? 12 : 16),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "",
                          width: context.isSmall ? 24 : 32,
                          height: context.isSmall ? 24 : 32,
                          colorFilter: ColorFilter.mode(
                              isSelected ? colors.text2 : colors.accent,
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
                            isSelected ? colors.text2 : colors.accent,
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
                  color: !isSelected ? Colors.transparent : colors.accent,
                ),
                child: isMenuExpanded
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            iconPath,
                            width: context.isSmall ? 24 : 32,
                            height: context.isSmall ? 24 : 32,
                            colorFilter: ColorFilter.mode(
                                isSelected ? colors.text2 : colors.accent,
                                BlendMode.srcIn),
                          ),
                          8.0.widthBox,
                          AppTextWidget(
                            title,
                            style: AppTextStyles.regular14().copyWith(
                                color:
                                    isSelected ? colors.text2 : colors.accent,
                                fontSize: context.isSmall ? 12 : 16),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "",
                            width: context.isSmall ? 24 : 32,
                            height: context.isSmall ? 24 : 32,
                            colorFilter: ColorFilter.mode(
                                isSelected ? colors.text2 : colors.accent,
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
                              isSelected ? colors.text2 : colors.accent,
                              BlendMode.srcIn),
                        ),
                      ),
              ),
            ),
          );
  }
}
