import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import '../Core/Theme/theme_model.dart';

import '../Utilities/Constants/strings.dart';
import '../Utilities/text_style_helper.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  const SectionsTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
     text: Strings.my.translate,
      style: TextStyleHandler.of(context)
          .displayTextStyleExtraBold48
          .copyWith(color: ThemeFactory.of(context).secondary),
      children: [
        TextSpan(
          text: title,
          style: TextStyleHandler.of(context)
              .displayTextStyleRegular48
              .copyWith(color: ThemeFactory.of(context).secondary),
        ),
      ]
    ),);
  }
}
