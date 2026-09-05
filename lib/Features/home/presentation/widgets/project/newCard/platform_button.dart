import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/version_item.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../domain/entities/project_entity.dart';

class PlatformButton extends StatefulWidget {
  final List<LinkEntity> links;
  final PlatformType type;
  final Color color;

  const PlatformButton(
      {super.key,
      required this.color,
      required this.links,
      required this.type});

  @override
  State<PlatformButton> createState() => _PlatformButtonState();
}

class _PlatformButtonState extends State<PlatformButton> {
  bool _hovered = false;
  bool _menuOpen = false;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry() {
    final colors = context.colors;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _toggleMenu,
            behavior: HitTestBehavior.translucent,
            child: const SizedBox.expand(),
          ),
          CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            targetAnchor: Alignment.bottomLeft,
            followerAnchor: Alignment.topLeft,
            offset: const Offset(0, 4),
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: const BoxConstraints(minWidth: 120),
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: colors.accentSoft.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      widget.links.map((v) => VersionItem(version: v)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleMenu() {
    if (_menuOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      _menuOpen = !_menuOpen;
    });
  }

  void _handleTap() {
    if (widget.links.length > 1) {
      _toggleMenu();
    } else if (widget.links.firstOrNull != null) {
      launchUrl(Uri.parse(widget.links.first.url ?? ""));
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: CustomButtonWidget.outLined(
            onPressed: _handleTap,
            borderRadiusValue: 8,
            height: 32,
            borderColor: colors.border,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              spacing: 4,
              children: [
                Text(
                  widget.links.firstOrNull?.name ?? '',
                  style:
                      AppTextStyles.t1(context: context, color: colors.text2),
                ),
                Icon(
                  Portfolio.link,
                  size: context.isLarge ? 14 : 12,
                  color: colors.text2,
                ),
              ],
            )),
      ),
    );
  }
}
