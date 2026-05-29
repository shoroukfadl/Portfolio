import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/extensions.dart';

class LinkCardWidget extends StatefulWidget {
  final LinkEntity link;
  final IconData icon;
  final Color color;

  const LinkCardWidget(
      {super.key, required this.link, required this.icon, required this.color});

  @override
  State<LinkCardWidget> createState() => _LinkCardWidgetState();
}

class _LinkCardWidgetState extends State<LinkCardWidget> {
  bool hover = false;
  void onHover(h) => setState(() {
        hover = h;
      });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
      onEnter: (x) => onHover(true),
      onExit: (x) => onHover(false),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => _launchURL(widget.link.url ?? ""),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: hover ? widget.color : Colors.transparent,
                border: Border.all(color: widget.color),
                borderRadius: BorderRadius.circular(100)),
            child: Text(
              widget.link.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular10(
                color: !hover ? widget.color : Colors.white,
              ),
            )),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
