import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';

class SkillCardWidget extends StatelessWidget {
  final SkillModel? skill;
  final TextStyle? skillStyle;
  final double width, height;

  const SkillCardWidget({
    super.key,
    this.skill,
    this.skillStyle,
    this.width = 220,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: width,
          height: height,
          decoration: BoxDecoration(
              border: Border.all(color: colors.border, width: 0.3),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Text(
                skill?.skillTitle ?? "",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: (skillStyle ?? AppTextStyles.codeL())
                    .copyWith(color: colors.textPrimary),
              ),
              Divider(
                color: colors.textPrimary,
                thickness: 1,
              ),
              ...skill?.skills.map((e) => Text(
                        e,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: (skillStyle ?? AppTextStyles.codeM())
                            .copyWith(color: colors.textSecondary),
                      )) ??
                  []
            ],
          ),
        ),
        // // الزر الدائري (Arrow Button)
        // Positioned(
        //   bottom: -4,
        //   right: 8,
        //   child: Container(
        //     width: 60,
        //     height: 60,
        //     decoration:  BoxDecoration(
        //       color: colors.accentCyan,
        //       shape: BoxShape.circle,
        //     ),
        //     child: const Icon(
        //       Icons.north_east,
        //       color: Colors.white,
        //       size: 30,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
