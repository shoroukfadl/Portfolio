import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/generated/assets.dart';

import '../../../../../Core/Language/app_styles.dart' show AppTextStyles;
import '../../../../../Utilities/Constants/strings.dart';

class TitleWidget extends StatelessWidget {
  final TextStyle? titleStyle;

  const TitleWidget({
    super.key,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 40,
            width: 88,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: colors.textPrimary)),
            child: Text(
              Strings.hello.translate,
              style: (titleStyle ?? AppTextStyles.bodyM())
                  .copyWith(color: colors.textPrimary),
            )),
        Positioned(
            right: -32,
            top: -20,
            child: Image.asset(
              Assets.images.about1.keyName,
              width: 40,
              height: 40,
            )),
      ],
    );
  }
}
