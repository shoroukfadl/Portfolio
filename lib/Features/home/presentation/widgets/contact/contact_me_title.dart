import 'package:flutter/cupertino.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';

class ContactMeTitle extends StatelessWidget {
  const ContactMeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's build your next app",
          style: AppTextStyles.h2(context: context, color: colors.text1),
        ),
        Text(
          "Available for freelance work or full-time Flutter development roles. Reach out and let's talk.",
          style: AppTextStyles.b1(context: context, color: colors.text2),
        ),
        8.0.heightBox,
      ],
    );
  }
}
