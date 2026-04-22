import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Models/user_data_model.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'education_widget.dart';

class EducationCard extends StatefulWidget {
  final EductionModel item;
  final int index;
  final int totalItems;

  const EducationCard({
    required this.item,
    required this.index,
    required this.totalItems,
  });

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() => _isExpanded = !_isExpanded);
    if (_isExpanded) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _toggleExpand,
          child: AnimatedBuilder(
            animation: _expandController,
            builder: (context, child) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: colors.accent
                          .withValues(alpha:
                        0.1 * _expandController.value,
                      ),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                  color: isDark
                      ?  colors.secondary.withValues(alpha:
                    0.08 + (0.07 * _expandController.value),
                  )
                      :  colors.secondary.withValues(alpha:
                    0.05 + (0.05 * _expandController.value),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item?.icon??"",
                          style:
                          const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.item.degree??"",
                                style: AppTextStyles.semiBold18(
                                  color:  colors.accent,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.item.field??"",
                                style: AppTextStyles.semiBold14(
                                  color: colors
                                      .secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Expand indicator
                        Transform.rotate(
                          angle: _expandController.value * 3.14159,
                          child: Icon(
                            Icons.expand_more,
                            color: colors
                                .accent,
                            size: 24,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Institution and year
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.item.institution??"",
                          style: AppTextStyles.medium14(
                            color: colors.fontColor2,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:  colors.secondary
                                .withValues(alpha:0.2),
                            borderRadius:
                            BorderRadius.circular(20),
                            border: Border.all(
                              color:  colors.secondary
                                  .withValues(alpha:0.4),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            widget.item.year??"",
                            style: AppTextStyles.medium12(
                              color:colors
                                  .secondary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Expanded content
                    SizeTransition(
                      sizeFactor: _expandController,
                      axisAlignment: -1,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 1,
                              color: colors.accent
                                  .withValues(alpha:0.2),
                              margin: const EdgeInsets.only(
                                  bottom: 16),
                            ),
                            Text(
                              widget.item.description??"",
                              style: AppTextStyles.regular12(
                                color:colors.fontColor2.withValues(alpha: 0.8),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: 8,
                              children: widget.item.details?.split('|').map((detail) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colors.accent
                                        .withValues(alpha:0.2),
                                    borderRadius:
                                    BorderRadius.circular(
                                        10),
                                  ),
                                  child: Text(
                                    detail.trim(),
                                    style: AppTextStyles.medium10(
                                      color:  colors.accent),
                                  ),
                                );
                              }).toList()??[],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}