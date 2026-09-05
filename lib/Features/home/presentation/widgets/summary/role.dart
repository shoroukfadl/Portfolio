import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Widgets/Portfilio/divider_widget.dart';

class RoleWidget extends StatelessWidget {
  final String role, location;

  const RoleWidget({super.key, required this.role, required this.location});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 4,
      children: [
        SizedBox(
            width: 20,
            child: DividerWidget(
              thickness: 2,
              color: colors.accent,
            )),
        Text("${role.toUpperCase()} . ${location.toUpperCase()}",
            style: AppTextStyles.l1(context: context, color: colors.secondary)
                .copyWith(letterSpacing: 1.3)),
      ],
    );
  }
}
