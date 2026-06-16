import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Widgets/rounded_image_widget.dart';

class WebPreview extends StatelessWidget {
  final String url;
  final String logoText;
  final double width,height;
  const WebPreview({required this.url, required this.logoText, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final colors= context.colors;
    return Container(
      decoration:  BoxDecoration(
        color:colors.background,
        borderRadius: BorderRadius.all( Radius.circular(Constants.cardRadius)),
      ),
      child: Stack(
        children: [


          RoundedImage(
            imagePath: url,
            fit: BoxFit.fill,
            height: height,
            width: width,
            backgroundColor: colors.background,
            radiusValue: Constants.cardRadius,
          ),
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration:  BoxDecoration(
              color: colors.text3,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Constants.cardRadius),
                topRight: Radius.circular(Constants.cardRadius),
              )
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
                      color: colors.card,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      logoText,
                      style:   AppTextStyles.titleCardSmall(context:context,color: colors.secondary),
                    ),
                  ),
                ),
              ],
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