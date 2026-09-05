import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class TimeLineItemWidget extends StatelessWidget {
  final Widget child;
  final bool hover;

  const TimeLineItemWidget({
    super.key,
    required this.child,
    this.hover = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          LineWidget(
            hover: hover,
          ),

          child.expand
        ],
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  final bool hover;
  const LineWidget({
    this.hover = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: 40,
      child: Column(
        children: [
          AnimatedContainer(
            width: 20,
            height: 20,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hover ? colors.accentSoft : Colors.transparent,
              border: Border.all(
                color: colors.accentSoft,
                width: 2,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: 1.5,
              color: colors.accentSoft,
            ),
          ),
        ],
      ),
    );
  }
}
