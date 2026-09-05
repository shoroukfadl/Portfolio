import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class HelperFunctions {
  static Future<void> showDialogHelper(BuildContext context,
      {required Widget contentWidget,
      Color? backgroundColor,
      String? title,
      AlignmentDirectional? alignment,
      final bool enablePadding = true,
      bool isFullScreen = true}) {
    final colors = context.colors;
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: title,
        barrierColor: colors.background,
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (_, anim, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
            child: ScaleTransition(
              scale: Tween(begin: .92, end: 1.0).animate(
                CurvedAnimation(parent: anim, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
        pageBuilder: (_, __, ___) => contentWidget);
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
        message: "",
        contentType: type ?? ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  static void openUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      showCustomToast(context,
          message: "Could not launch $url", type: ContentType.failure);
    }
  }

  static Future<void> openWhatsApp({
    required String phoneNumber,
    String message = '',
  }) async {
    try {
      String cleanPhone = phoneNumber
          .replaceAll('+', '')
          .replaceAll(' ', '')
          .replaceAll('-', '')
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll(RegExp(r'[^0-9]'), '');

      String url = 'https://wa.me/$cleanPhone';
      if (message.isNotEmpty) {
        url += '?text=${Uri.encodeComponent(message)}';
      }

      final Uri whatsappUri = Uri.parse(url);
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
