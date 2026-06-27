import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Animation/animations.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

class ProjectsButton extends StatefulWidget {
  const ProjectsButton({super.key});

  @override
  State<ProjectsButton> createState() => _ProjectsButtonState();
}

class _ProjectsButtonState extends State<ProjectsButton> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final height = context.matchedSize(
        large: largeButtonHeight,
        medium: mediumButtonHeight,
        small: smallButtonHeight);
    return HoverAnimatedWidget(
      zoomOut: true,
      child: (hover) => CustomButtonWidget(
        shadow: !hover
            ? null
            : BoxShadow(
                color: colors.accent.withValues(alpha: 0.1),
                offset: Offset(0, 2),
                spreadRadius: 4,
                blurRadius: 4),
        padding: EdgeInsets.symmetric(horizontal: 16),
        onPressed: () {
          Scrollable.ensureVisible(
            GlobalKeys.projects.currentContext!,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        },
        height: height,
        btnColor: colors.background,
        borderColor: hover ? colors.text1 : colors.accent,
        borderRadiusValue: 100,
        child: Row(
          spacing: 4,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.projects.translate,
              style: AppTextStyles.buttonLabel(
                  context: context,
                  color: hover ? colors.text1 : colors.accent),
            ),
            Icon(
              Icons.keyboard_double_arrow_down,
              color: hover ? colors.text1 : colors.accent,
              size: height / 2,
            ),
          ],
        ),
      ),
    );
  }
}
