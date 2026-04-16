import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../Utilities/Constants/global_keys.dart';
import '../../../../Utilities/Constants/strings.dart';
import '../../../../Widgets/Buttons/custom_button_widget.dart';
import '../../../../Widgets/Inputs/custom_text_form_field.dart';
import '../../../../Widgets/sections_title_widget.dart';
import '../../../Homel/home_controller.dart';

class ContactMeWidget extends StatelessWidget {
  final HomeController con;

  const ContactMeWidget({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      height: 500,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionsTitleWidget(
            enableMy: false,
            key: GlobalKeys.contactMe,
            title: Strings.contactMe.translate,
            // titleStyle: titleStyle,
            // myStyle: myStyle,
          ),
          Divider(
            height: 1,
            color: context.colors.border,
          ),
          Row(
            children: [
              const Column(
                children: [],
              ).expand,
              Column(
                children: [
                  CustomTextFormField(
                    key: GlobalKeys.contactMe,
                    width: 1,
                    controller: con.nameController,
                    lableText: Strings.name.translate,
                  ),
                  16.0.heightBox,
                  CustomTextFormField(
                    controller: con.emailController,
                    lableText: Strings.email.translate,
                  ),
                  16.0.heightBox,
                  CustomTextFormField(
                    controller: con.phoneController,
                    lableText: Strings.yourPhone.translate,
                  ),
                  16.0.heightBox,
                  CustomTextFormField(
                    controller: con.messageController,
                    lableText: Strings.message.translate,
                    maxLine: 5,
                    minLines: 5,
                  ),
                  16.0.heightBox,
                  CustomButtonWidget(
                    onPressed: () {
                      con.sendMessage();
                    },
                    title: Strings.send.translate,
                  )
                ],
              ).expand,
            ],
          ),
        ],
      ),
    );
  }
}
