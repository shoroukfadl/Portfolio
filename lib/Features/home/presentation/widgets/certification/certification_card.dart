import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class CertificationCard extends StatefulWidget {
  final CertificateEntity item;
  final double imageWidth, imageHeight;

  const CertificationCard({
    super.key,
    required this.item,
    this.imageHeight = 48,
    this.imageWidth=72,
  });

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool hover =false;
  void hovering(bool h)=> setState(() {
    hover =h;
  });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      onEnter: (_) => hovering(true),
      onExit: (_) => hovering(false),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                if(widget.item.certificateImageUrl !=null) {
                  HelperFunctions.openUrl(widget.item.certificateImageUrl!, context);
                }
              },
              child: AnimatedScale(
                duration: const Duration(microseconds: 250),
                scale: hover?1.05:1,
                child: RoundedImage(
                  imagePath: widget.item.certificateImageUrl,
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                  radiusValue: 0,
                  borderColor: hover?colors.accent:Colors.transparent,
                ),
              )),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.courseName ?? "",
                style:  AppTextStyles.titleCardLarge(context: context,
                  color: colors.text1,
                ),
              ),
              Text(
                widget.item.provider ?? "",
                style: AppTextStyles.label(context: context,
                  color: colors.accent,
                ),
              ),
            ],
          ).expand,
          CardWithText(
            text: widget.item.issueDate ?? "",
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: colors.secondary,
            ),

            color: colors.secondary.withValues(alpha: 0.2),
            borderColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
