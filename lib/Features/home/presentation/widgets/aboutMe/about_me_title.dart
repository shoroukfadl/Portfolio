import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/helper_function.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';
import '../../../../Homel/home_controller.dart';

class SummaryContent extends StatelessWidget {
  final String firstName,lastName, role, summary;
  final TextStyle? nameStyle, roleStyle, summaryStyle;
  const SummaryContent(
      {super.key,
      required this.firstName,
      required this.role,
      required this.summary,
      this.nameStyle,
      this.roleStyle,
      this.summaryStyle, required this.lastName});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '━ ${Strings.helloIam.translate}',
          style: AppTextStyles.semiBold16(color: colors.accent),
        ),
        const SizedBox(height: 10),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              colors.accent,
              colors.secondary
            ],
          ).createShader(bounds),
          child: Text(
            '$firstName\n $lastName',
            style: AppTextStyles.extraBold56(color: colors.accent).copyWith(
              height: 1.1,
              letterSpacing: -2,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
         Text(
          role,
           style: AppTextStyles.semiBold24(color: colors.accent),
        ),
        const SizedBox(height: 20),
         Text(
           summary,
           style: AppTextStyles.regular14(color: colors.fontColor2).copyWith(
            height: 1.8,
          ),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 40),
        Row(
          spacing: 16,
          children: [
            CustomButtonWidget(
              onPressed: () {
                String? url = HomeController().user?.cv;
                if (url != null) HelperFunctions.openUrl(url, context);
              },
              btnColor: colors.accent,
              width: 140,
              height: 40,
              child: Row(
                spacing: 4,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      Strings.resume.translate,
                    style: AppTextStyles.medium14(
                      color: Colors.white
                    ),
                  ),
                  const Icon(Portfolio.cv,size: 14,color: Colors.white,),

                ],
              ),
            ),
            CustomButtonWidget.outLined(

              onPressed: () {
                String gmailWebUri =
                    "https://mail.google.com/mail/?view=cm&fs=1&to=${HomeController().user?.email}";
                HelperFunctions.openUrl(gmailWebUri, context);
              },
              borderColor: colors.secondary,
              width: 40,
              height: 40,
              child: Icon(
                Portfolio.email,
                color: colors.secondary,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


