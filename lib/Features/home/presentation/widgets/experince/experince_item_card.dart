import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Custom/top_line_animated_card.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../domain/entities/experince_entity.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({
    super.key,
    required this.item,
  });

  final ExperienceEntity item;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final space = context.matchedSize(large: 32, medium: 24, small: 16);
    final width = context.matchedSize(
      large: maxWidth * 2 / 3,
      medium: maxWidth * 3.2 / 4,
      small: maxWidth,
    );

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: TopLineCardWidget(
        width: width,
        paddingHoz: space,
        paddingVert: space,
        child: (h) => _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              item.positionTitle ?? '',
              style: AppTextStyles.hc1(context: context, color: colors.text1),
            ).expand,
            _buildDateBadge(context),
          ],
        ),
        4.0.heightBox,
        Text(
          _subtitleText,
          style: AppTextStyles.bl1(context: context, color: colors.text2),
        ),
        if (item.description.isNotEmpty) ...[
          12.0.heightBox,
          ...item.description.map((point) => PointText(point: point)),
        ],
      ],
    );
  }

  Widget _buildDateBadge(BuildContext context) {
    final colors = context.colors;

    return CardWithText(
      text: _dateRangeText,
      color: colors.accent.withValues(alpha: 0.1),
      borderColor: Colors.transparent,
      textColor: colors.accent,
      border: 4,
      hozPadding: 4,
      vertPadding: 4,
      style: AppTextStyles.l3(context: context, color: colors.accent),
    );
  }

  String get _dateRangeText {
    final start = item.startDate?.yyyyMM ?? '';
    final end = item.endDate?.yyyyMM ?? 'Present';
    return '$start - $end';
  }

  String get _subtitleText {
    final company = item.companyName ?? '';
    final location = item.location ?? '';
    return '$company . $location';
  }
}
