import 'package:flutter/material.dart';
import 'package:rocklis/Widgets/custom_text_form_field.dart';

import '../../../Core/Theme/theme_model.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: ThemeFactory.of(context).card,
      child: Row(
        children: [
          Column(
            children: [
              CustomTextFormField()
            ],
          )
        ],
      ),
    );
  }
}
