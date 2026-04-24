import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import '../../../../../Core/Language/app_styles.dart';
import 'certification_card.dart';

class CertificationSection extends StatelessWidget {
  final List<CertificateEntity> data;
  const CertificationSection({super.key,  this.data =const []});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          spacing: 8,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colors.accent25,
              child: Text(
                '📦',
                style: AppTextStyles.extraBold32(
                  color: colors.accent,
                ),
              ),
            ),
            Container(
              width: 4,
              height: 64.0 * data.length,
              decoration: BoxDecoration(
                  color: colors.accent25,
                  borderRadius: const BorderRadius.all(Radius.circular(2))),
            )
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (c,i)=>8.0.heightBox,
          itemBuilder: (context, index) {
            return CertificationCard(
              item: data[index],
            );
          },
        ).expand,
      ],
    );
  }
}



