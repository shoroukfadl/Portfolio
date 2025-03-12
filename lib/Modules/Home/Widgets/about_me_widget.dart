import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/text_style_helper.dart';
import '../../../generated/assets.dart';

class AboutMeWidget extends StatelessWidget {
  final String desc;
  final TextStyle? titleStyle , descStyle;
  final double? imageSize;
  const AboutMeWidget({super.key, required this.desc, this.titleStyle, this.descStyle, this.imageSize});
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(Assets.imagesGroup ,width:imageSize?? 480,height: imageSize?? 480,),
        32.0.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Strings.aboutMe.translate , style:(titleStyle??
                TextStyleHandler.of(context).displayTextStyleRegular48).copyWith(
              color: ThemeFactory.of(context).primary
            ),),
            16.0.heightBox,
            Text(desc, style: (descStyle ??TextStyleHandler.of(context).headingTextStyleBold20).copyWith(
              color: ThemeFactory.of(context).secondary
            ),)
          ],
        ).expandFlex(2)

      ],
    ).paddingSymmetric(horizontal: 32, vertical: 40);
  }
}
