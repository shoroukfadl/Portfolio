import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Utilities/text_style_helper.dart';
import 'package:portfolio/generated/assets.dart';

import '../../../Models/user_data_model.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Widgets/custom_rounded_icon_button.dart';

class PersonalInfoWidget extends StatelessWidget {
  final PersonalData? personalData;
  final TextStyle? helloStyle , nameStyle , roleStyle , developerStyle , basedInStyle , locationStyle;
  final double? imageSize , buttonSize;
  const PersonalInfoWidget({super.key, this.personalData, this.helloStyle, this.nameStyle, this.roleStyle, this.developerStyle, this.basedInStyle, this.locationStyle, this.imageSize, this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              key:  GlobalKeys.aboutMe,
              text: TextSpan(
                  text: Strings.helloIam.translate,
                  style: helloStyle ?? TextStyleHandler.of(context).displayTextStyleRegular48,
                  children: [
                    TextSpan(
                      text: " ${personalData?.name ?? ""}\n",
                      style: nameStyle ?? TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: "${personalData?.role ?? ""}\n",
                      style: roleStyle ?? TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: "${Strings.developer.translate}\n",
                      style: developerStyle?? TextStyleHandler.of(context)
                          .outLinedTextStyleExtraBold48,
                    ),
                    TextSpan(
                      text: Strings.basedIn.translate,
                      style: basedInStyle ?? TextStyleHandler.of(context)
                          .displayTextStyleRegular48,
                    ),
                    TextSpan(
                      text: " ${personalData?.location ?? ""}\n",
                      style: locationStyle ?? TextStyleHandler.of(context)
                          .displayTextStyleExtraBold48,
                    ),
                  ]),
            ),
            16.0.heightBox,
            // Text(
            //   personalData?.shortDesc ?? "",
            //   style: TextStyleHandler.of(context)
            //       .paragraphTextStyleBold20
            //       .copyWith(color: ThemeFactory.of(context).secondary300),
            // ),
            // 32.0.heightBox,
            Row(
              children: [
                CustomRoundedIconButton(
                    onPressed: () {
                      HelperFunctions.openUrl(
                          personalData?.links?.linkedIn ?? "", context);
                    },
                    buttonSize: buttonSize,
                    iconSize:buttonSize == null ? null : buttonSize!-8,
                    iconPath: Assets.iconLinkedin),
                16.0.widthBox,
                CustomRoundedIconButton(
                    onPressed: () {
                      HelperFunctions.openUrl(
                          personalData?.links?.github ?? "", context);
                    },
                    buttonSize: buttonSize,
                    iconSize:buttonSize == null ? null : buttonSize!-8,
                    iconPath: Assets.iconsGithub),
                16.0.widthBox,
                CustomRoundedIconButton(
                    onPressed: () {
                      String gmailWebUri = "https://mail.google.com/mail/?view=cm&fs=1&to=${personalData?.links?.email}";
                      HelperFunctions.openUrl(gmailWebUri, context);
                    },
                    buttonSize: buttonSize,
                    iconSize:buttonSize == null ? null : buttonSize!-8,
                    iconPath: Assets.iconsMail),

              ],
            ),
          ],
        ).expandFlex(2),
        SvgPicture.asset(
          Assets.imagesGirlbanner,
          width: imageSize ??400,
          height:imageSize ??400,
        ).expand,
      ],
    );
  }
}
