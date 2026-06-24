import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Widgets/rounded_image_widget.dart';

class WebPreview extends StatelessWidget {
  final String url;
  final String logoText;
  final double width, height, imageWidth;

  const WebPreview({
    super.key,
    required this.url,
    required this.logoText,
    required this.width,
    required this.height,
    required this.imageWidth,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.surface, colors.background],
        ),
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      child: Center(
        child: Container(
          height: (height * (2 / 3)) + 32,
          width: imageWidth,
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(cardRadius),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.14),
                  blurRadius: 20,
                  offset: const Offset(0, 4)),
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 4,
                  offset: const Offset(0, 1)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ── Browser Bar ──────────────────────────────
              Container(
                height: 32,
                width: imageWidth,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: colors.text3,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(cardRadius / 2),
                    topRight: Radius.circular(cardRadius / 2),
                  ),
                ),
                child: Row(
                  children: [
                    _dot(const Color(0xFFFF5F57)),
                    const SizedBox(width: 5),
                    _dot(const Color(0xFFFEBC2E)),
                    const SizedBox(width: 5),
                    _dot(const Color(0xFF28C840)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 24,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: colors.card,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          logoText,
                          style: AppTextStyles.titleCardSmall(
                            context: context,
                            color: colors.secondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RoundedImage(
                imagePath: url,
                fit: BoxFit.cover,
                height: height * (2 / 3),
                width: imageWidth,
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(cardRadius/2),bottomRight: Radius.circular(cardRadius/2)),
                backgroundColor: colors.background,
                // radiusValue: cardRadius / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(Color color) => CircleAvatar(
        radius: 4,
        backgroundColor: color,
      );
}
