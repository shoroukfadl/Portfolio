import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Widgets/rounded_image_widget.dart';

class WebPreview extends StatelessWidget {
  final String url;
  final String logoText;
  const WebPreview({required this.url, required this.logoText});

  @override
  Widget build(BuildContext context) {
    final colors= context.colors;
    return Container(
      decoration:  BoxDecoration(
        color:colors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(Constants.cardRadius)),
      ),
      child: Column(
        children: [
          // Browser bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration:  BoxDecoration(
              color: colors.accentSoft,
              border: Border(bottom: BorderSide(color: colors.accent, width: 1)),
            ),
            child: Row(
              children: [
                _dot(const Color(0xFFFF5F57)),
                const SizedBox(width: 5),
                _dot(const Color(0xFFFEBC2E)),
                const SizedBox(width: 5),
                _dot(const Color(0xFF28C840)),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 24,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: colors.background,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      logoText,
                      style:   AppTextStyles.medium10(color: colors.secondaryEv),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content area
          Center(
            child: RoundedImage(
              imagePath: url,
              fit: BoxFit.contain,
              height: 100,
              width: 200,
              backgroundColor: colors.background,
              radiusValue: 0,
              radius: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(Color color) => Container(
    width: 8, height: 8,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );

}