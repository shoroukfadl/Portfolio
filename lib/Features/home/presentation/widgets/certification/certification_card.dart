import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/hover_widget.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class CertificationCard extends StatelessWidget {
  final CertificateEntity item;

  const CertificationCard({super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return HoverWidget(
      builder: (hover)=> AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: hover?1.02:1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.courseName ?? "",
                  style: AppTextStyles.semiBold16(
                    color: colors.accent,
                  ),
                ),
                Text(
                  (item.provider ?? "")+' - '+( item.issueDate ?? ""),
                  style: AppTextStyles.medium16(
                    color: colors.secondary,
                  ),
                ),
              ],
            ).expand,

            InkWell(onTap: (){}, child: RoundedImage(
              imagePath: item.certificateImageUrl,
              width: 140,
              height: 80,
              radiusValue: 8,
            )),




          ],
        ),
      ),
    );
  }
}
