import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Custom/top_line_animated_card.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key,
    this.item,
    required this.isLast,
  });

  final EducationEntity? item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    final width = context.matchedSize(
      large: maxWidth * 2 / 3,
      medium: maxWidth * 3.2 / 4,
      small: maxWidth,
    );

    return TopLineCardWidget(
      width: width,
      paddingHoz: 32,
      paddingVert: 32,
      child: (h) => Padding(
        padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            8.0.heightBox,
            _buildSubtitle(context),
            if (_hasDescription) ...[
              12.0.heightBox,
              ..._buildDescriptionPoints(),
            ],
          ],
        ),
      ),
    );
  }

  bool get _hasDescription => item?.description.isNotEmpty ?? false;

  Widget _buildHeader(BuildContext context) {
    final colors = context.colors;

    return Row(
      spacing: 4,
      children: [
        Text(
          item?.degree ?? '',
          style: AppTextStyles.hc1(context: context, color: colors.text1),
        ).expand,
        CardWithText(
          text: _dateRangeText,
          color: colors.secondarySoft,
          borderColor: Colors.transparent,
          textColor: colors.secondary,
          border: 4,
          hozPadding: 4,
          vertPadding: 2,
          style: AppTextStyles.l3(context: context, color: colors.secondary),
        ),
      ],
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    final colors = context.colors;

    return Text(
      _subtitleText,
      style: AppTextStyles.bl1(context: context, color: colors.text2),
    );
  }

  List<Widget> _buildDescriptionPoints() =>
      item!.description.map((point) => PointText(point: point)).toList();

  String get _dateRangeText {
    final start = item?.startDate?.yyyy ?? '';
    final end = item?.endDate?.yyyy ?? '';
    return '$start - $end';
  }

  String get _subtitleText {
    final institution = item?.institution ?? '';
    final field = item?.fieldOfStudy ?? '';
    final gpa = item?.gpa;
    final gpaText = gpa != null ? ' . GPA $gpa/4' : '';
    return '$institution — $field$gpaText';
  }
}
