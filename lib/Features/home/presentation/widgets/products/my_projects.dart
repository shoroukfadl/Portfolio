import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_list.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatefulWidget {
  final List<ProjectEntity> projects;
  final double hozPadding;

  const MyProjectsWidget(
      {super.key,
      this.projects = const [],
      this.hozPadding = desktopHozPadding,
      });

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  bool isMan = true;
  late List<ProjectEntity> man, auto;
  @override
  void initState() {
    super.initState();
  }

  void previewMan(bool m) => setState(() {
        isMan = m;
      });
  @override
  Widget build(BuildContext context) {
    man = widget.projects.where((e) => e.isManual != false).toList();
    auto = widget.projects.where((e) => !e.isManual).toList();
    final colors = context.colors;
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          title: Strings.projects.translate.toUpperCase(),
          subtitle: '${widget.projects.length} Projects',
        ),
        Row(
          children: [
            CustomButtonWidget(
              title: 'Manual Testing',
              onPressed: () {
                if (!isMan) previewMan(true);
              },
              width: 120,
              titleStyle: AppTextStyles.medium10()
                  .copyWith(color: !isMan ? colors.text1 : Colors.white),
              borderColor: isMan ? colors.accent : colors.text3,
              btnColor:
                  isMan ? colors.accent : colors.text3.withValues(alpha: 0.2),
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(8),
                bottomStart: Radius.circular(8),
              ),
            ),
            CustomButtonWidget(
              title: 'Automation Testing',
              onPressed: () {
                if (isMan) previewMan(false);
              },
              width: 140,
              titleStyle: AppTextStyles.medium10()
                  .copyWith(color: isMan ? colors.text1 : Colors.white),
              borderColor: !isMan ? colors.accent : colors.text3,
              btnColor:
                  !isMan ? colors.accent : colors.text3.withValues(alpha: 0.2),
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(8),
                bottomEnd: Radius.circular(8),
              ),
            ),
          ],
        ),
        if (isMan)
          ProjectsList(
            projects: man,
          )
        else
          ProjectsList(
            projects: auto,
          )
      ],
    ).paddingSymmetric(horizontal: widget.hozPadding);
  }
}
