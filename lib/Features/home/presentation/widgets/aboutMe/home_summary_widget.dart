import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/about_me_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/stat_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Widgets/MainLayout/menu_button.dart';

class HomeSummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  final int projectsNumber, certNumber;
  final double hozPadding;

  const HomeSummarySection({
    super.key,
    this.hozPadding = desktopHozPadding,
    required this.profile,
    required this.projectsNumber,
    required this.certNumber,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // للشاشات الصغيرة (Mobile / Tablet)
    if (!context.isLarge) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBackground(
            height: double.infinity,
            child: _SmallContent(colors),
          ),

          Positioned(
            top: 16,
            left: hozPadding,
            right: hozPadding,
            child: const MenuButton(),
          ),
        ],
      );
    }

    return AnimatedBackground(
      height: double.infinity,
      child: _LargeContent(colors),
    );
  }

  // ──────────────────────────────────────────
  // LARGE CONTENT (DESKTOP)
  // ──────────────────────────────────────────
  Widget _LargeContent(AppColors colors) => Padding(
    padding: EdgeInsets.only(left: hozPadding, right: hozPadding, top: 40),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TagBadge(),
        const SizedBox(height: 16),
        const _Headline(),
        const SizedBox(height: 16),
        Text(
          profile?.summary ?? "",
          style: AppTextStyles.regular14(
            color: colors.text3,
          ),
        ),
        const SizedBox(height: 16),
        Divider(
          color: colors.border,
          thickness: 0.5,
        ),
        const SizedBox(height: 16),
        StatsRow(
          items: [
            Stat(
              value: projectsNumber,
              name: 'Projects Tested',
            ),
            Stat(
              value: certNumber,
              name: 'Certifications',
            ),
            const Stat(
              value: 2,
              name: 'Testing Tracks',
            ),
            const Stat(
              value: 100,
              subTitle: '%',
              name: 'Attention to Detail',
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    ),
  );

  // ──────────────────────────────────────────
  // SMALL CONTENT (MOBILE / TABLET)
  // ──────────────────────────────────────────
  Widget _SmallContent(AppColors colors) => Padding(
    padding: EdgeInsets.only(left: hozPadding, right: hozPadding, top: 56 ,bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SummarySection(profile: profile),
        const SizedBox(height: 8),
        const DividerWidget(),
        const SizedBox(height: 8),
        _Headline(titleStyle: AppTextStyles.semiBold14(color: colors.text1)),
        const SizedBox(height: 8),
        Text(
          profile?.summary ?? "",
          style: AppTextStyles.regular10(
            color: colors.text3,
          ),
        ),
        const SizedBox(height: 8),
        const DividerWidget(
          thickness: 0.5,
        ),
        const SizedBox(height: 8),
        StatsRow(
          numStyle: AppTextStyles.medium20(),
          titleStyle: AppTextStyles.regular10(),
          items: [
            Stat(
              value: projectsNumber,
              name: 'Projects Tested',
            ),
            Stat(
              value: certNumber,
              name: 'Certifications',
            ),
            const Stat(
              value: 2,
              name: 'Testing Tracks',
            ),
            const Stat(
              value: 100,
              subTitle: '%',
              name: 'Attention to Detail',
            ),
          ],
        ),
      ],
    ),
  );
}

// ──────────────────────────────────────────
//  TAG BADGE
// ──────────────────────────────────────────
class _TagBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: colors.accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: colors.accent.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('🧪', style: TextStyle(fontSize: 12)),
          const SizedBox(width: 6),
          Text('QA · SOFTWARE TESTING',
              style: AppTextStyles.regular12(color: colors.accent)),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────
//  GRADIENT HEADLINE
// ──────────────────────────────────────────
class _Headline extends StatelessWidget {
  final TextStyle? titleStyle;
  const _Headline({this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return RichText(
      text: TextSpan(
        style: AppTextStyles.medium20(color: colors.text3),
        children: [
          TextSpan(
            text: 'Ensuring Quality,\n',
            style: titleStyle ?? AppTextStyles.semiBold28(color: colors.text1),
          ),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [colors.secondary, colors.secondary, colors.accent],
              ).createShader(bounds),
              child: Text(
                'One Test Case at a Time.',
                style: (titleStyle ?? AppTextStyles.semiBold28()).copyWith(color: colors.text3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}