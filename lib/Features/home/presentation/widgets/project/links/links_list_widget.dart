import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import 'link_card_widget.dart';

class LinksListWidget extends StatelessWidget {
  final List<LinkEntity> links;
  final IconData icon;
  final String title;
  final Color color;

  const LinksListWidget({
    super.key,
    this.links = const [],
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (links.isEmpty) return const SizedBox.shrink();
    return Row(spacing: 8, children: [
      CircleAvatar(
        radius: 14,
        backgroundColor: color.withValues(alpha: 0.3),
        child: Icon(
          icon,
          size: 16,
          color: color,
        ),
      ),
      Wrap(
        spacing: 12,
        runSpacing: 10,
        children: [
          ...List.generate(
              links.length < 3 ? links.length : 3,
              (i) => LinkCardWidget(
                    link: links[i],
                    icon: icon,
                    color: color,
                  )),
        ],
      ).expand,
      if (links.length > 3)
        InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: Text(
            '+ ${links.length - 2} More',
            style: AppTextStyles.hc1(context: context, color: colors.text1)
                .copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: colors.text1),
          ),
        )
    ]);
  }
}
