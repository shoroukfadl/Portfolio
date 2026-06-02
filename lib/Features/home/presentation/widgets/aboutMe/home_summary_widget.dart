import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class HomeSummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  final int projectsNumber, certNumber;
  const HomeSummarySection({super.key, required this.profile, required this.projectsNumber, required this.certNumber});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      children: [
        const AnimatedBackground(),
        PositionedDirectional(
          start: 40,
          end: 40,
          top: 40,
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
               _StatsRow(items: [
                Stat(value:'$projectsNumber',name: 'Projects Tested',),
                Stat(value:"$certNumber",name: 'Certifications',),
                const Stat(value:"2",name: 'Testing Tracks',),
                const Stat(value:"100 %",name: 'Attention to Detail',),
              ],)

            ],
          ),
        ),
      ],
    );
  }
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
          Text(
            'QA · SOFTWARE TESTING',
            style: AppTextStyles.regular12(
              color: colors.accent
            )
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────
//  GRADIENT HEADLINE
// ──────────────────────────────────────────
class _Headline extends StatelessWidget {
  const _Headline();

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return RichText(
      text: TextSpan(
        style: AppTextStyles.medium20(color: colors.text3),
        children: [
          TextSpan(
            text: 'Ensuring Quality,\n',
            style: AppTextStyles.semiBold28(color: colors.text1),
          ),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) =>  LinearGradient(
                colors: [colors.accent, colors.secondary],
              ).createShader(bounds),
              child:  Text(
                'One Test Case at a Time.',
                   style: AppTextStyles.semiBold28(color: colors.text3),

            ),
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────
//  STATS ROW
// ──────────────────────────────────────────
class _StatsRow extends StatelessWidget {
  final List<Stat> items;
  const _StatsRow({this.items=const[]});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 20,
      children: items
          .map((s) => _StatItem(
        item: s,
      ))
          .toList(),
    );
  }
}

// ──────────────────────────────────────────
//  SINGLE STAT
// ──────────────────────────────────────────
class _StatItem extends StatelessWidget {
 final Stat item;

  const _StatItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient number
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [colors.text1, colors.accent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            item.value??"",
              style: AppTextStyles.medium32(color: colors.text1),
    ),
        ),
        const SizedBox(height: 5),
        Text(
          item.name?.toUpperCase()??"",
          style: AppTextStyles.regular12(color: colors.text3),
        ),
      ],
    );
  }
}


class Stat {
  final String? name;
  final String?value;
  const Stat({this.name, this.value});
}