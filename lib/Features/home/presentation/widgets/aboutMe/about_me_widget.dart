import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';
class SummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  const SummarySection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {

     final colors = context.colors;
    return Column(
      children: [
        RoundedImage(
          width: 120,
          height: 120,
          imagePath: profile?.image,
        ),
        Text(
          profile?.firstName??"" ,
          style: AppTextStyles.semiBold20(color:colors.text1,),
        ), Text(
          profile?.lastName??"",
          style: AppTextStyles.semiBold20(
            color:colors.text1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          profile?.jobTitle??"",
          style:  AppTextStyles.medium14(
            color:colors.accent,
          ),
        ),

      ],
    );
  }
}
