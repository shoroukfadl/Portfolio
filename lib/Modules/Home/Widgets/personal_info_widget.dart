import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/generated/assets.dart';

import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/custom_rounded_icon_button.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: Strings.basedIn.translate,
                      style: TextStyleHandler.of(context)
                          .displayTextStyleRegular48,
                    ),
                    TextSpan(
                      text: "Giza",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                  ]),
            ),
            16.0.heightBox,
            Text(
              "I'm Flora Sheen Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to specimen book.",
              style: TextStyleHandler.of(context).paragraphTextStyleBold20.copyWith(
                color: ThemeFactory.of(context).secondary300
              ),
            ),
            32.0.heightBox,
            Row(
              children: [

                CustomRoundedIconButton(onPressed: (){}, iconPath: Assets.iconLinkedin),
                16.0.widthBox,
                CustomRoundedIconButton(onPressed: (){}, iconPath: Assets.iconsGithub),
              ],
            ),
          ],
        ).expandFlex(2),
        SvgPicture.asset(
          Assets.imagesGirlbanner,
          width: 400,
          height: 400,
        ).expand,
      ],
    );
  }
}
