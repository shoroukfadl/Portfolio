import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../Core/Theme/theme_model.dart';
import '../Utilities/Constants/strings.dart';
import '../Utilities/text_style_helper.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final TextStyle? myStyle , titleStyle;
  const SectionsTitleWidget({super.key, required this.title, this.myStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
     text: Strings.my.translate,
      style:( myStyle?? TextStyleHandler.of(context)
          .displayTextStyleExtraBold48)
          .copyWith(color: ThemeFactory.of(context).secondary),
      children: [
        TextSpan(
          text: " $title",
          style: (titleStyle?? TextStyleHandler.of(context)
              .displayTextStyleRegular48)
              .copyWith(color: ThemeFactory.of(context).secondary),
        ),
      ]
    ),);
  }
}
