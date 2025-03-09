import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Core/Theme/theme_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/generated/assets.dart';

import '../../../Models/user_data_model.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/custom_rounded_icon_button.dart';

class PersonalInfoWidget extends StatelessWidget {
  final PersonalData? personalData;
  const PersonalInfoWidget({super.key, this.personalData});

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
                      text: " ${personalData?.name ?? ""}\n",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: "${personalData?.role ?? ""}\n",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: "${Strings.developer.translate}\n",
                      style: TextStyleHandler.of(context)
                          .outLinedTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: Strings.basedIn.translate,
                      style: TextStyleHandler.of(context)
                          .displayTextStyleRegular48,
                    ),
                    TextSpan(
                      text: " ${personalData?.location ?? ""}\n",
                      style: TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                  ]),
            ),
            16.0.heightBox,
            Text(
              personalData?.shortDesc ?? "",
              style: TextStyleHandler.of(context)
                  .paragraphTextStyleBold20
                  .copyWith(color: ThemeFactory.of(context).secondary300),
            ),
            32.0.heightBox,
            Row(
              children: [
                CustomRoundedIconButton(
                    onPressed: () {
                      HelperFunctions.openUrl(
                          personalData?.links?.linkedIn ?? "", context);
                    },
                    iconPath: Assets.iconLinkedin),
                16.0.widthBox,
                CustomRoundedIconButton(
                    onPressed: () {
                      HelperFunctions.openUrl(
                          personalData?.links?.github ?? "", context);
                    },
                    iconPath: Assets.iconsGithub),
                16.0.widthBox,
                CustomRoundedIconButton(
                    onPressed: () {
                      HelperFunctions.openUrl(
                          personalData?.links?.email ?? "", context);
                    },
                    iconPath: Assets.iconsMail),

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
