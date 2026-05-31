import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/version_item.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/Constants/enums.dart';
import '../../../../domain/entities/project_entity.dart';

class PlatformButton extends StatefulWidget {
  final List<LinkEntity> links;
  final PlatformType type;
  const PlatformButton({super.key, required this.links, required this.type});

  @override
  State<PlatformButton> createState() => _PlatformButtonState();
}

class _PlatformButtonState extends State<PlatformButton> {
  bool _hovered = false;
  bool _menuOpen = false;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  String get _label => switch (widget.type) {
    PlatformType.web    => 'Web',
    PlatformType.ios     => 'iOS',
    PlatformType.android => 'Android',
  };

  IconData get _icon => switch (widget.type) {
    PlatformType.web     => Icons.language_rounded,
    PlatformType.ios     => Icons.apple_rounded,
    PlatformType.android => Icons.android_rounded,
  };

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
                  color: colors.accentSoft.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.links
                      .map((v) => VersionItem(version: v))
                      .toList(),
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
        onExit:  (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: _handleTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
            decoration: BoxDecoration(
              color: _hovered ? colors.accent : colors.accentSoft.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _icon,
                  size: 12,
                  color: _hovered ? Colors.white : colors.secondaryEv,
                ),
                const SizedBox(width: 5),
                Text(
                  _label,
                  style: AppTextStyles.medium10(color: _hovered ? Colors.white : colors.secondaryEv),
                ),
                if (widget.links.length > 1) ...[
                  const SizedBox(width: 3),
                  AnimatedRotation(
                    turns: _menuOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 160),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 12,
                      color: _hovered ? Colors.white : colors.secondaryEv,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}