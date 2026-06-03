import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../../../Widgets/Custom/card_with_animation.dart';

class CertificationCard extends StatelessWidget {
  final CertificateEntity item;

  const CertificationCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {},
            child: RoundedImage(
              imagePath: item.certificateImageUrl,
              width: 72,
              height: 48,
              radiusValue: 0,
            )),
        Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.courseName ?? "",
              style: AppTextStyles.semiBold14(
                color: colors.text1,
              ),
            ),
            Text(
              '${item.provider ?? ""}',
              style: AppTextStyles.medium12(
                color: colors.accent,
              ),
            ),
          ],
        ).expand,
        CardWithText(
          text: item.issueDate ?? "",
          style: AppTextStyles.regular10(
            color: colors.secondary,
          ),
          color: colors.secondary.withValues(alpha: 0.2),
          borderColor: colors.secondary,
        )
      ],
    );
  }
}
