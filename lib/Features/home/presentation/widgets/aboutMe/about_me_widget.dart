import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_title.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/shared_preferences.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import 'floating_card_widget.dart';

class SummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  const SummarySection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {

     final colors = context.colors;
    return Column(
      children: [
        RoundedImage(
          width: 140,
          height: 140,
          imagePath: profile?.image,
        ),
        Text(
          profile?.firstName??"",
          style: AppTextStyles.bold24(color:colors.accent,),
        ), Text(
          profile?.lastName??"",
          style: AppTextStyles.bold20(
            color:colors.accent,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile?.jobTitle??"",
          style:  AppTextStyles.medium20(
            color:colors.accent,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          profile?.summary??"",
          style:  AppTextStyles.medium20(
            color:colors.secondary,
          ),
        ),
      ],
    );
  }
}
