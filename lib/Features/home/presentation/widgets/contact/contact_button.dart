import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class ContactButton extends StatelessWidget {
  final double width, height, iconSize;
  final Function() onTap;
  final IconData icon;
  final Color? backgroundColor, borderColor, iconColor;
  const ContactButton(
      {super.key,
      this.width = 32,
      this.height = 32,
      this.iconSize = 14,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.borderColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomButtonWidget(
      borderRadiusValue: 4,
      onPressed:onTap,
      btnColor: backgroundColor??Colors.transparent,
      borderColor:  borderColor ?? colors.text3,
      width: width,
      height: height,
      child: Icon(
        icon,
        color: iconColor?? colors.text3,
        size: iconSize,
      ),
    );
  }
}
