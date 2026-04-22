import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_title.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/shared_preferences.dart';

import 'floating_card_widget.dart';

class SummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  const SummarySection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {

     final colors = context.colors;
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>  LinearGradient(
            colors: [
             colors.accent,
              colors.secondary
            ],
          ).createShader(bounds),
          child: const Text(
            'PASS ✓',
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          profile?.firstName??"",
          style: AppTextStyles.extraBold32(
            color:colors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Senior Software QC Engineer',
          style: TextStyle(
            fontSize: 18,
            color: colors.accent.withValues(alpha: 0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: colors.accent.withValues(alpha: 0.7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'SYSTEM STATUS: OPERATIONAL ✓',
            style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              color: colors.accent.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '3+ years of expertise in comprehensive software testing, automation engineering, and quality assurance excellence',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: colors.accent.withValues(alpha: 0.7),
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
