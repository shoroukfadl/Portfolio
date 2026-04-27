import 'package:flutter/material.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Models/user_data_model.dart';

class ExperienceItemCard extends StatefulWidget {
  final ExperienceModel? item;
  final bool hasNext;
  final int index; // ضفنا الـ index عشان نوزع وقت الـ Animation
  final TextStyle? nameStyle, dateStyle, locationStyle, descriptionStyle;

  const ExperienceItemCard({
    super.key,
    this.hasNext = true,
    this.item,
    required this.index,
    this.nameStyle,
    this.dateStyle,
    this.locationStyle,
    this.descriptionStyle,
  });

  @override
  State<ExperienceItemCard> createState() => _ExperienceItemCardState();
}

class _ExperienceItemCardState extends State<ExperienceItemCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    // تشغيل الـ Animation بتأخير يعتمد على ترتيب الكارت
    Future.delayed(Duration(milliseconds: widget.index * 200), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Terminal Line ---
                _buildTimeline(colors),
                const SizedBox(width: 20),

                // --- Content Log ---
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(colors),
                      const SizedBox(height: 10),
                      _buildMetadata(colors),
                      const SizedBox(height: 15),
                      _buildDescription(colors),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeline(AppColors colors) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: _isHovered ? colors.secondary : colors.accent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (_isHovered ? colors.secondary : colors.accent)
                    .withOpacity(0.5),
                blurRadius: _isHovered ? 15 : 5,
                spreadRadius: _isHovered ? 2 : 0,
              )
            ],
          ),
        ),
        if (widget.hasNext)
          Expanded(
            child: Container(
              width: 1.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [colors.accent.withOpacity(0.5), Colors.transparent],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildHeader(AppColors colors) {
    return Row(
      children: [
        Text(
          widget.item?.company ?? "",
          style: (widget.nameStyle ?? AppTextStyles.semiBold24()).copyWith(
            color: _isHovered ? colors.secondary : colors.accent,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 1,
            color: _isHovered
                ? colors.secondary.withValues(alpha: 0.4)
                : colors.accent.withValues(alpha: 0.4),
          ),
        ),
      ],
    );
  }

  Widget _buildMetadata(AppColors colors) {
    return Wrap(
      spacing: 15,
      children: [
        _metaIconText(Portfolio.date, widget.item?.duration ?? "", colors),
        _metaIconText(null, widget.item?.position ?? "", colors),
      ],
    );
  }

  Widget _metaIconText(IconData? icon, String text, AppColors colors) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        if (icon != null) Icon(icon, size: 14, color: colors.textSecondary),
        Text(text,
            style: (widget.dateStyle ??
                AppTextStyles.regular12(color: colors.textSecondary))),
      ],
    );
  }

  Widget _buildDescription(AppColors colors) {
    return Text(
      widget.item?.description ?? "",
      style: (widget.descriptionStyle ?? AppTextStyles.regular14())
          .copyWith(
        color: colors.textSecondary.withOpacity(0.7),
        height: 1.6,
      ),
    );
  }
}
