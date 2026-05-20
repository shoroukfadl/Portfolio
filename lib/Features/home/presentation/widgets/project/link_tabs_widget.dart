import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkTabsWidget extends StatefulWidget {
  final List<LinkEntity> ios;
  final List<LinkEntity> web;
  final List<LinkEntity> android;

  const LinkTabsWidget({
    super.key,
    this.ios = const [],
    this.web = const [],
    this.android = const [],
  });

  @override
  State<LinkTabsWidget> createState() => _LinkTabsWidgetState();
}

class _LinkTabsWidgetState extends State<LinkTabsWidget> {
  int currentIndex = 0;

  List<Map<String, dynamic>> get availablePlatforms => [
    if (widget.web.isNotEmpty) {'title': 'Web', 'links': widget.web, 'icon': Icons.language},
    if (widget.android.isNotEmpty) {'title': 'Android', 'links': widget.android, 'icon': Icons.android},
    if (widget.ios.isNotEmpty) {'title': 'iOS', 'links': widget.ios, 'icon': Icons.apple},
  ];

  @override
  Widget build(BuildContext context) {
    if (currentIndex >= availablePlatforms.length && availablePlatforms.isNotEmpty) {
      currentIndex = 0;
    }

    final colors = context.colors;

    if (availablePlatforms.isEmpty) return const SizedBox.shrink();

    final currentPlatform = availablePlatforms[currentIndex];
    final List<LinkEntity> activeList = currentPlatform['links'];

    return Wrap(
      spacing: 12,
      runSpacing: 10,
      key: ValueKey<int>(currentIndex),
      children: activeList.map((link) => _buildLinkCard(link, currentPlatform['icon'])).toList(),
    );
  }


  Widget _buildLinkCard(LinkEntity link, IconData icon) {
    final colors = context.colors;
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: ()=>_launchURL(link.url??""),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
            link.name??"",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular12(color: colors.textPrimary),
          ),
             Icon(icon, size: 14),
          ]
        ),
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