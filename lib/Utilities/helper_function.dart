import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Core/Theme/theme_model.dart';
import 'text_style_helper.dart';

abstract class HelperFunctions {
  static void showBottomSheet(BuildContext context,
      {required Widget widget,
      Color? backgroundColor,
      bool isFullScreen = true}) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: isFullScreen,
        backgroundColor: backgroundColor ?? ThemeFactory.of(context).primary,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              backgroundColor:
                  backgroundColor ?? ThemeFactory.of(context).primary,
              builder: (context) {
                return widget;
              });
        });
  }

  static void showDialogHelper(BuildContext context,
      {required Widget contentWidget,
      Color? backgroundColor,
      AlignmentDirectional? alignment,
      final bool enablePadding = true,
      bool isFullScreen = true}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              alignment: alignment,
              shadowColor: ThemeFactory.of(context).font1.withOpacity(0.25),
              backgroundColor:
                  backgroundColor ?? ThemeFactory.of(context).backgroundColor,
              contentPadding: enablePadding
                  ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.0)
                  : EdgeInsets.zero,
              content: contentWidget,
            ));
  }

  static void showCustomToast(
    BuildContext context, {
    String? message,
    ContentType? type,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: message ?? "",
        titleTextStyle: TextStyleHandler.of(context).bold14.copyWith(
              color: ThemeFactory.of(context).fontWhite,
            ),
        message: "",
        contentType: type ?? ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }


  static void openUrl(String url,BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
     await launchUrl(uri);
    }

    else showCustomToast(context , message: "Could not launch $url");
  }




}


