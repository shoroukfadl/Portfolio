import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class EmailButton extends StatefulWidget {
  final String email;
  const EmailButton({super.key, required this.email});

  @override
  State<EmailButton> createState() => _EmailButtonState();
}

class _EmailButtonState extends State<EmailButton> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget(
      onHover: (v) {
        if (v == hover) {
          return;
        } else {
          setState(() {
            hover = v;
          });
        }
      },
      onPressed: () async {
        final Uri emailUri = Uri(scheme: 'mailto', path: widget.email);
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        }
      },
      borderColor: colors.secondary,
      width: 140,
      btnColor: hover ? colors.secondary : Colors.transparent,
      borderRadiusValue: 8,
      height: 32,
      child: AnimatedScale(
        scale: hover ? 1.08 : 1,
        duration: const Duration(milliseconds: 400),
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Get In Touch', style: AppTextStyles.buttonLabel(context: context,              color: hover ? Colors.white : colors.secondary,),),
            Icon(
              Icons.arrow_right_alt_outlined,
              color: hover ? Colors.white : colors.secondary,
              size: 20,
            ),
          ],
        )
      ),
    );
  }
}
