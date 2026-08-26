import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';

class ProjectTitle extends StatelessWidget {
  final String title;
  const ProjectTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      children: [
        Icon(
          Icons.folder_rounded,
          color: colors.warning,
          size: 16,
        ),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: colors.text2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
