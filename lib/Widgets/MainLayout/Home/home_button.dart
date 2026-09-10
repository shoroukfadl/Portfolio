import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

class FloatingScrollToTop extends StatefulWidget {
  const FloatingScrollToTop({
    super.key,
    required this.controller,
    this.size = 52,
    this.strokeWidth = 2.5,
    this.bottom = 24,
    this.right = 24,
  });

  final ScrollController controller;
  final double size;
  final double strokeWidth;
  final double bottom;
  final double right;

  @override
  State<FloatingScrollToTop> createState() => _FloatingScrollToTopState();
}

class _FloatingScrollToTopState extends State<FloatingScrollToTop> {
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.controller.hasClients) return;

    final position = widget.controller.position;

    final maxScroll = position.maxScrollExtent;

    final progress =
        maxScroll <= 0 ? 0.0 : (position.pixels / maxScroll).clamp(0.0, 1.0);

    if (progress != _progress) {
      setState(() {
        _progress = progress;
      });
    }
  }

  Future<void> _scrollToTop() async {
    if (!widget.controller.hasClients) return;

    await widget.controller.animateTo(
      0,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final visible = _progress > 0.01;

    return Positioned(
      right: widget.right,
      bottom: widget.bottom,
      child: AnimatedScale(
        scale: visible ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        child: AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: CircularProgressIndicator(
                    value: _progress,
                    strokeWidth: widget.strokeWidth,
                    backgroundColor: colors.accentSoft,
                    valueColor: AlwaysStoppedAnimation(colors.accent),
                  ),
                ),

// Button
                Material(
                  color: colors.secondarySoft,
                  shape: const CircleBorder(),
                  elevation: 6,
                  child: InkWell(
                    onTap: _scrollToTop,
                    customBorder: const CircleBorder(),
                    child: SizedBox(
                      width: widget.size - 8,
                      height: widget.size - 8,
                      child: Icon(
                        Portfolio.summary,
                        color: colors.secondary,
                        size: widget.size * 0.45,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
