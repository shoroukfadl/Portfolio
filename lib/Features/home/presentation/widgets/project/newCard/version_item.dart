import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../Core/Language/app_styles.dart';

class VersionItem extends StatefulWidget {
  final LinkEntity version;
  const VersionItem({required this.version});

  @override
  State<VersionItem> createState() => _VersionItemState();
}

class _VersionItemState extends State<VersionItem> {

  @override
  Widget build(BuildContext context) {
    final isLast = widget.version == (context.findAncestorWidgetOfExactType<Column>()?.children.last as VersionItem?)?.version;
    final colors = context.colors;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () => launchUrl(Uri.parse(widget.version.url??"")),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          border: isLast
              ? null
              :  Border(bottom: BorderSide(color: colors.accent, width: 1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.version.name??"",
              style: AppTextStyles.titleCardSmall(context:context,color: colors.text2),
            ),
            const SizedBox(width: 8),
             Text(
              '↗',
              style: TextStyle(fontSize: 10, color: colors.text1),
            ),
          ],
        ),
      ),
    );
  }
}