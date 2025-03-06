import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocklis/Utilities/extensions.dart';

import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../generated/assets.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(Assets.iconsGithub ).expand,
        16.0.widthBox,
        Column(
          children: [
            Text(Strings.aboutMe.translate , style: TextStyleHandler.of(context).headingTextStyleBold20,),
            16.0.heightBox,
            Text("description here , this is description ...............", style: TextStyleHandler.of(context).headingTextStyleBold20,)
          ],
        )

      ],
    );
  }
}
