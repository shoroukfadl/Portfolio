import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

class ArrowBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const ArrowBtn({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedOpacity(
      opacity: onTap != null ? 1 : .2,
      duration: const Duration(milliseconds: 200),
      child: CustomButtonWidget(
        btnColor: colors.text3,
        borderRadiusValue: 40,
        onPressed: onTap,
        height: 40,
        width: 40,
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
