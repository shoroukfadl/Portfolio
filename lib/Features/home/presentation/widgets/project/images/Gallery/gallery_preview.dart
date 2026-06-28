import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/Gallery/main_view.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/images/Gallery/thumbnails.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Buttons/close_button.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../newCard/arrow_button.dart';

class GalleryPreviewDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final String? title;
  final bool isMobile;

  const GalleryPreviewDialog({
    super.key,
    required this.images,
    this.initialIndex = 0,
    this.title,
    this.isMobile = false,
  });

  static Future<void> show(
    BuildContext context, {
    required List<String> images,
    int initialIndex = 0,
    String? title,
    bool isMobile = false,
  }) {
    return HelperFunctions.showDialogHelper(
      context,
      title: 'Gallery',
      contentWidget: GalleryPreviewDialog(
        images: images,
        initialIndex: initialIndex,
        title: title,
        isMobile: isMobile,
      ),
    );
  }

  @override
  State<GalleryPreviewDialog> createState() => _GalleryPreviewDialogState();
}

class _GalleryPreviewDialogState extends State<GalleryPreviewDialog> {
  late PageController _pageController;
  late int _current;
  final TransformationController _transformController =
      TransformationController();
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    HardwareKeyboard.instance.addHandler(_onKey);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _transformController.dispose();
    HardwareKeyboard.instance.removeHandler(_onKey);
    super.dispose();
  }

  bool _onKey(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) _next();
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) _prev();
      if (event.logicalKey == LogicalKeyboardKey.escape) Navigator.pop(context);
    }
    return false;
  }

  void _next() {
    if (_current < widget.images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _prev() {
    if (_current > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void _resetZoom() {
    _transformController.value = Matrix4.identity();
    setState(() => _isZoomed = false);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final size = MediaQuery.sizeOf(context);

    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      onKeyEvent: (_) {},
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // ── MAIN DIALOG ──
            Center(
              child: Container(
                width: context.isLarge ? size.width * .85 : size.width * .95,
                height: context.isLarge ? size.height * .88 : size.height * .9,
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: colors.text3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .6),
                      blurRadius: 60,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildHeader(colors),
                    Expanded(
                        child: MainViewWidget(
                            isMobile: widget.isMobile,
                            onDoubleTap: () {
                              if (_isZoomed) {
                                _resetZoom();
                              } else {
                                setState(() => _isZoomed = true);
                                _transformController.value = Matrix4.identity()
                                  ..scale(2.0);
                              }
                            },
                            pageController: _pageController,
                            isZoomed: _isZoomed,
                            onPageChange: (i) => setState(() {
                                  _current = i;
                                  _resetZoom();
                                }),
                            transformController: (i) =>
                                i == _current ? _transformController : null,
                            onInteractionEnd: () {
                              final scale = _transformController.value
                                  .getMaxScaleOnAxis();
                              setState(() => _isZoomed = scale > 1.05);
                            },
                            images: widget.images)),
                    if (widget.images.length > 1)
                      ThumbnailsWidget(
                        images: widget.images,
                        current: _current,
                        onSelectOne: (i) {
                          _pageController.animateToPage(
                            i,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOutCubic,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),

            // ── ARROW: PREV ──
            if (widget.images.length > 1)
              Positioned(
                left: context.isLarge ? size.width * .04 : 4,
                top: 0,
                bottom: 0,
                child: Center(
                  child: ArrowBtn(
                    icon: Icons.chevron_left_rounded,
                    onTap: _current > 0 ? _prev : null,
                  ),
                ),
              ),

            // ── ARROW: NEXT ──
            if (widget.images.length > 1)
              Positioned(
                right: context.isLarge ? size.width * .04 : 4,
                top: 0,
                bottom: 0,
                child: Center(
                  child: ArrowBtn(
                    icon: Icons.chevron_right_rounded,
                    onTap: _current < widget.images.length - 1 ? _next : null,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppColors colors) {
    final img = widget.images[_current];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colors.text3.withValues(alpha: .07)),
        ),
      ),
      child: Row(
        children: [
          if (widget.title != null)
            Text(widget.title!,
                style: AppTextStyles.title(
                    context: context, color: colors.accent)),

          Spacer(),
          // Counter
          CardWithText(
              text: '${_current + 1} / ${widget.images.length}',
              color: colors.accent.withValues(alpha: .06),
              borderColor: colors.accent.withValues(alpha: .06),
              border: 8,
              vertPadding: 6,
              style: AppTextStyles.titleCardSmall(
                  context: context, color: colors.accent)),

          const SizedBox(width: 10),

          // Zoom reset
          if (_isZoomed)
            IconToolTipButtonWidget(
              icon: Icons.zoom_out_rounded,
              tooltip: 'Reset zoom',
              onTap: _resetZoom,
            ),

          const SizedBox(width: 6),

          // Close
          IconToolTipButtonWidget(
            icon: Icons.close_rounded,
            tooltip: 'Close (Esc)',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
