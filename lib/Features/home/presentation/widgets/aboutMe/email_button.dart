import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Utilities/portifilo_icons.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class EmailButton extends StatefulWidget {
  final String email;
  const EmailButton({super.key, required this.email});

  @override
  State<EmailButton> createState() => _EmailButtonState();
}

class _EmailButtonState extends State<EmailButton> {
  bool  hover =false;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget(
      onHover: (v){
        if(v == hover) {
          return;
        } else {
          setState(() {
          hover =v;
        });
        }
      },
      onPressed: () async {
        final Uri emailUri = Uri(scheme: 'mailto', path: widget.email);
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        }
      },
      borderColor: colors.
      accent,
      btnColor: hover ? colors.accent:Colors.transparent,

      borderRadiusValue: 8,
      width: 40,
      height: 40,
      child: AnimatedScale(
        scale: hover? 1.08:1,
        duration: const Duration(milliseconds: 400),
        child: Icon(
          Icons.email,
          color:hover ?Colors.white: colors.accent,
          size: 20,
        ),
      ),
    );
  }
}
