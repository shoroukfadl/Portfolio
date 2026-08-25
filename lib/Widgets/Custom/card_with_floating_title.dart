import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';

class FloatingTitle extends StatelessWidget {
  final String title;
  final Widget? leadingWidget;
  final Color? backgroundColor, fontColor, borderColor;
  const FloatingTitle({
    super.key,
    required this.title,
    this.leadingWidget,
    this.backgroundColor,
    this.borderColor,
    this.fontColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? colors.card, width: 4),
          color: backgroundColor ?? colors.secondary,
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(cardRadius),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingWidget != null) leadingWidget!,
          Text(
            title,
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: fontColor ?? colors.background,
            ),
          ),
          0.0.widthBox
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final Color? cardColor, borderColor;
  final Widget child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;
  final bool hover;

  const CardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    this.hover = false,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.height,
    this.borderR,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: width,
      height: height,
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: cardColor ?? colors.card,
        borderRadius: borderR ?? BorderRadius.circular(border),
        boxShadow: [
          if (hover)
            BoxShadow(
                color: colors.text3.withValues(alpha: 0.28),
                blurRadius: 10,
                spreadRadius: 4)
        ],
        border: Border.all(
          color: borderColor ?? colors.text3,
          width: hover ? 0.4 : 0.1,
        ),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: paddingHoz, vertical: paddingVert),
      child: child,
    );
  }
}

class CardWithFloatingTitle extends StatefulWidget {
  final Color? cardColor, borderColor;
  final Widget child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;
  final double postionTop;
  final String title;
  final Widget? leadingWidget, subTitle;
  final Color? backgroundColor, fontColor, titleBorderColor;
  final bool enableHoverAnimation;

  const CardWithFloatingTitle({
    super.key,
    this.cardColor,
    this.borderColor,
    this.postionTop = -16,
    required this.child,
    this.paddingHoz = 8,
    this.paddingVert = 8,
    this.border = cardRadius,
    this.borderR,
    this.width,
    this.height,
    required this.title,
    this.leadingWidget,
    this.backgroundColor,
    this.fontColor,
    this.titleBorderColor,
    this.enableHoverAnimation = true,
    this.subTitle,
  });

  @override
  State<CardWithFloatingTitle> createState() => _CardWithFloatingTitleState();
}

class _CardWithFloatingTitleState extends State<CardWithFloatingTitle> {
  @override
  Widget build(BuildContext context) {
    return InteractiveCard(
      child: (_isHovering) => AnimatedScale(
        scale: _isHovering ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Column(
          children: [
            CardWidget(
              hover: _isHovering,
              borderColor: widget.borderColor,
              borderR: widget.borderR,
              border: widget.border,
              cardColor: widget.cardColor,
              paddingHoz: widget.paddingHoz,
              paddingVert: widget.paddingVert,
              width: widget.width,
              height: widget.height,
              child: widget.child,
            ),
            Positioned(
              top: widget.postionTop,
              left: 8,
              child: FloatingTitle(
                title: widget.title,
                borderColor: widget.borderColor,
                backgroundColor: widget.backgroundColor,
                fontColor: widget.fontColor,
                leadingWidget: widget.leadingWidget,
              ),
            ),
            if (widget.subTitle != null)
              Positioned(
                  top: widget.postionTop, right: 8, child: widget.subTitle!),
          ],
        ),
      ),
    );
  }
}

class CardWithTitle extends StatefulWidget {
  final Color? cardColor, borderColor;
  final Widget child;
  final double paddingHoz, paddingVert, border;
  final BorderRadiusGeometry? borderR;
  final double? width, height;

  const CardWithTitle({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 8,
    this.paddingVert = 8,
    this.border = cardRadius,
    this.borderR,
    this.width,
    this.height,
  });

  @override
  State<CardWithTitle> createState() => _CardWithTitleState();
}

class _CardWithTitleState extends State<CardWithTitle> {
  @override
  Widget build(BuildContext context) {
    return InteractiveCard(
      child: (hover) => AnimatedScale(
        scale: hover ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: CardWidget(
          hover: hover,
          borderColor: widget.borderColor,
          borderR: widget.borderR,
          border: widget.border,
          cardColor: widget.cardColor,
          paddingHoz: widget.paddingHoz,
          paddingVert: widget.paddingVert,
          width: widget.width,
          height: widget.height,
          child: widget.child,
        ),
      ),
    );
  }
}
