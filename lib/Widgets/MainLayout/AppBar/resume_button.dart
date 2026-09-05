import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/Constants/strings.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

class CustomResumeButton extends StatefulWidget {
  const CustomResumeButton({super.key});

  @override
  State<CustomResumeButton> createState() => _CustomResumeButtonState();
}

class _CustomResumeButtonState extends State<CustomResumeButton> {
  bool hover = false;

  void onHover(bool value) {
    if (value == hover) {
      return;
    } else {
      setState(() {
        hover = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.matchedSize(
        large: largeButtonIcon,
        medium: mediumButtonIcon,
        small: smallButtonIcon);
    return CustomButtonWidget(
        onPressed: () {
          final cv = context.read<PortfolioCubit>().state.data?.profile?.cv;
          if (cv == null || cv.isEmpty) return;
          HelperFunctions.openUrl(cv, context);
        },
        onHover: (hov) {
          onHover(hov);
        },
        btnColor: hover ? colors.accent : colors.text1,
        height: size,
        padding: EdgeInsets.symmetric(horizontal: 8),
        borderRadiusValue: 8,
        child: AnimatedScale(
          scale: hover ? 1.03 : 1,
          duration: Duration(microseconds: 300),
          child: Row(spacing: 4, children: [
            Text(
              Strings.resume.translate,
              style:
                  AppTextStyles.bl1(context: context, color: colors.background),
            ),
            Icon(Icons.arrow_downward, size: 14, color: colors.background),
          ]),
        ));
  }
}
