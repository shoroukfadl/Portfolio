import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';

class WebPreviewWidget extends StatelessWidget {
  final double width, height, border, circleRadius;
  final String projectName;
  const WebPreviewWidget(
      {super.key,
      this.border = 16,
      this.width = 480,
      this.circleRadius = 6,
      this.height = 48,
      required this.projectName});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(border),
          topEnd: Radius.circular(border),
        ),
        color: colors.border,
      ),
      child: Row(
        spacing: 8,
        children: [
          CircleAvatar(
            radius: circleRadius,
            backgroundColor: Colors.redAccent,
          ),
          CircleAvatar(
            radius: circleRadius,
            backgroundColor: Colors.yellow,
          ),
          CircleAvatar(
            radius: circleRadius,
            backgroundColor: Colors.green,
          ),
          0.0.widthBox,
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
            color: colors.textSecondary,
              borderRadius: BorderRadius.circular(6)
              
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              projectName,
              style: AppTextStyles.medium14(color: colors.border),
            ),
          ).expand
        ],
      ),
    );
  }
}
