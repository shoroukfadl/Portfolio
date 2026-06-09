import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/profile_image.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class LargeSummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  const LargeSummarySection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        ProfileImage(
          width: 120,
          height: 120,
          image: profile?.image??"",
        ),
        Text(
          profile?.firstName ?? "",
          style: AppTextStyles.semiBold20(
            color: colors.text1,
          ),
        ),
        Text(
          profile?.lastName ?? "",
          style: AppTextStyles.semiBold20(
            color: colors.text1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile?.jobTitle ?? "",
          style: AppTextStyles.medium14(
            color: colors.accent,
          ),
        ),
      ],
    );
  }
}

class SummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  const SummarySection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 16,
      children: [
        ProfileImage(
          width: 88,
          height: 88,
          image: profile?.image??"",
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Text(
             ( profile?.firstName ?? "") +( profile?.lastName ?? ""),
              style: AppTextStyles.semiBold16(
                color: colors.text2,
              ),
            ),

            const SizedBox(height: 4),
            Text(
              profile?.jobTitle ?? "",
              style: AppTextStyles.medium12(
                color: colors.accent,
              ),
            ),
          ],
        ).expand,
      ],
    );
  }
}
