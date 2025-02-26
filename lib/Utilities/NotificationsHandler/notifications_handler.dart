import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rocklis/Core/Language/locales.dart';

import '../../Core/Theme/theme_model.dart';
import '../../Widgets/custom_button_widget.dart';
import '../Constants/strings.dart';
import '../router_config.dart';
import '../text_style_helper.dart';

class NotificationsHandler {
  ///------   Firebase Messaging  ------------
// Notifications

  static void onFirebaseOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("onMessageOpenedApp occured . Message is : ");
      debugPrint(event.notification?.title);
    });
  }

  static void firebaseOnMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      // ignore: unnecessary_null_comparison
      if (message != null) {
        final title = message.notification?.title;
        final body = message.notification?.body;
        showDialog(
          context: CURRENT_CONTEXT!,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
              titlePadding: EdgeInsets.zero,
              title: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: ThemeFactory.of(context).primary.withOpacity(0.3),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.notifications_active,
                            color: Colors.orange, size: 32),
                        const SizedBox(width: 10),
                        Text(
                          Strings.newNotification.tr,
                          style: TextStyleHelper.of(context).bold18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: TextStyleHelper.of(context).bold18,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    body!,
                    style: TextStyleHelper.of(context).regular16.copyWith(
                          color: ThemeFactory.of(context).font2,
                        ),
                  ),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                CustomButtonWidget(
                  title: Strings.good.tr,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      }
    });
  }
}
