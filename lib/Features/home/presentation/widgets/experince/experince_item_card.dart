import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';

class ExperinceItemCard extends StatefulWidget {
  final ExperienceEntity? item;
  final TextStyle? nameStyle, dateStyle, locationStyle, descriptionStyle;

  const ExperinceItemCard({
    super.key,
    this.item,
    this.nameStyle,
    this.dateStyle,
    this.locationStyle,
    this.descriptionStyle,
  });

  @override
  State<ExperinceItemCard> createState() => _ExperinceItemCardState();
}

class _ExperinceItemCardState extends State<ExperinceItemCard> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isActive = widget.item?.status ?? false;

    return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: _isHovered ? colors.accent: colors.secondary,
                width:_isHovered ? 3: 2,
              ),
            ),
            color: colors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item?.companyName ?? "",
                        style: AppTextStyles.semiBold16(color: colors.secondary)
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.item?.jobTitle ?? "",
                        style: AppTextStyles.medium14(color: colors.text1))
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: !isActive
                          ? colors.accent25.withOpacity(0.2)
                          : colors.secondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.item?.status == true ? 'Active' : 'Closed',
                      style: AppTextStyles.regular12(
                        color: isActive ? colors.secondary : colors.accent50,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.item?.period ?? "",
                style:  AppTextStyles.regular12(color: colors.text2)
              ),
              const SizedBox(height: 8),
              Text(
                widget.item?.responsibilities.firstOrNull ?? "",
                style:  AppTextStyles.medium12(color: colors.text2)
              ),
            ],
          ),
        ));
  }
}
