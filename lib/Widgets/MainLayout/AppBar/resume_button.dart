import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/Constants/strings.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

class CustomResumeButton extends StatelessWidget {
  const CustomResumeButton({super.key});

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
      btnColor: colors.text1,
      height: size,
      padding: EdgeInsets.symmetric(horizontal: 8),
      borderRadiusValue: 8,
      child: Text(
        Strings.resume.translate,
        style: AppTextStyles.buttonLabel(
            context: context, color: colors.background),
      ),
    );
  }
}
