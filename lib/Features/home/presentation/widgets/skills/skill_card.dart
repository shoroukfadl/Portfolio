import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';

class SkillCard extends StatefulWidget {
  final SkillEntity? skill;
  final int index;

  const SkillCard({super.key,
    required this.skill,
    required this.index,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      child: AnimatedBuilder(
        animation: _hoverController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -10 * _hoverController.value),
            child: Container(

              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(44),
                  bottomLeft: Radius.circular(44),
                  bottomRight: Radius.circular(16),
                ),
                // borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color:colors.accent.withValues(alpha:
                    0.2 + (0.2 * _hoverController.value),
                  ),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color:colors.accent.withValues(alpha:
                    0.1 * _hoverController.value,
                    ),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
                color:colors.accent.withValues(alpha:
                0.05 + (0.05 * _hoverController.value),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   widget.skill.icon??"",
                  //   style: const TextStyle(fontSize: 36),
                  // ),
                  const SizedBox(height: 15),
                  Text(
                    widget.skill?.category??"",
                    style: AppTextStyles.semiBold16(
                      color:colors.accent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.skill?.skillName??"",
                     style: AppTextStyles.regular14(
                    color:colors.textSecondary,
                  ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}