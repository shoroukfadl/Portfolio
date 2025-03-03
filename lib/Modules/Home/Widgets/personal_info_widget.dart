import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rocklis/Utilities/extensions.dart';
import 'package:rocklis/Utilities/text_style_helper.dart';
import 'package:rocklis/generated/assets.dart';

import '../../../Utilities/Constants/strings.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesGirlbanner).expand,
        Column(
          children: [
            RichText(
              text: TextSpan(
                  text: Strings.helloIam.translate,
                  style: TextStyleHandler.of(context).displayTextStyleRegular48,
                  children: [
                    TextSpan(
                      text: "Shorouk Fadl\n",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: "Flutter",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),


                    TextSpan(
                      text: "Developer\n",
                      style: TextStyleHandler.of(context)
                          .outLinedTextStyleExtraBold48,
                    ),

              TextSpan(
                  text:"${ Strings.basedIn.translate}",
                  style: TextStyleHandler.of(context).displayTextStyleRegular48,),

                    TextSpan(
                      text: "Giza",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                  ]),
            )
          ],
        )
      ],
    );
  }
}
