import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class SkillCard extends StatefulWidget {
  final TechnicalSkillEntity? skill;
  final int index;

  const SkillCard({
    super.key,
    required this.skill,
    required this.index,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1,
        duration: const Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            border: Border.all(
              color: colors.surface,
              width: 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: colors.secondary,
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ]
                : null,
            color: colors.surfaceElevated,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              RoundedImage(
                imagePath: widget.skill?.icon ?? "",
                width: 40,
                height: 40,
                radiusValue: 0,
                backgroundColor: Colors.transparent,
              ),
              Text(
                widget.skill?.category ?? "",
                style: AppTextStyles.semiBold16(
                  color: colors.textPrimary,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...List.generate(
                      widget.skill?.skills.length ?? 0,
                      (i) => Text(
                            (widget.skill?.skills[i].skillName ?? ""),
                            style: AppTextStyles.regular16(
                              color: colors.textSecondary,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
