import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';


import '../../../Core/Theme/theme_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/custom_button_widget.dart';
import '../../../Widgets/custom_text_form_field.dart';
import '../home_controller.dart';

class ContactMeWidget extends StatelessWidget {
  final HomeController con;
  const ContactMeWidget({super.key, required this.con});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          children: [

            CustomTextFormField(
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
            ),
            16.0.heightBox,
            CustomButtonWidget(onPressed: (){} , title: Strings.send.translate,)
          ],
        )
      ],
    );
  }
}
