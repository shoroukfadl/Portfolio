import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_text_form_field.dart';
import '../home_controller.dart';

class ContactMeWidget extends StatelessWidget {
  final HomeController con;
  const ContactMeWidget({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomTextFormField(
          key:  GlobalKeys.contactMe,
          width: 1.sw,
          controller: con.nameController,
          lableText: Strings.name.translate,
        ),
        16.0.heightBox,
        CustomTextFormField(
          width: 1.sw,
          controller: con.emailController,
          lableText: Strings.email.translate,
        ),
        16.0.heightBox,
        CustomTextFormField(
          width: 1.sw,
          controller: con.phoneController,
          lableText: Strings.yourPhone.translate,
        ),
        16.0.heightBox,
        CustomTextFormField(
          controller: con.messageController,
          lableText: Strings.message.translate,
          width: 1.sw,
          maxLine: 5,
          minLines: 5,
        ),
        16.0.heightBox,
        CustomButtonWidget(onPressed: (){} , title: Strings.send.translate,)
      ],
    ).paddingSymmetric(horizontal: 32 , vertical: 40);
  }
}
