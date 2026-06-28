import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/projects_list_widget.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/Animation/animated_list.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'newCard/project_card_widget.dart';

class MyProjectsWidget extends StatefulWidget {
  final List<ProjectEntity> projects;
  final double imageWidth, mainAxisExtent, padding;
  final int perRow;

  const MyProjectsWidget(
      {super.key,
      this.mainAxisExtent = 360,
      this.projects = const [],
      this.perRow = 4,
      this.imageWidth = 100,
      this.padding = desktopHozPadding});

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  int selectedIndex = 0;
  late List<ProjectEntity> mobile, web;

  void onUpdateIndex(int index) => setState(() {
        selectedIndex = index;
      });

  Widget getChild() {
    if (selectedIndex == 0) {
      return childWidget(widget.projects);
    } else if (selectedIndex == 1) {
      return childWidget(
        mobile,
      );
    } else if (selectedIndex == 2) {
      return childWidget(
        web,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget childWidget(List<ProjectEntity> items) {
    return ProjectsListWidget(
            perRow: widget.perRow,
            items: items,
            mainAxisExtent: widget.mainAxisExtent)
        .paddingSymmetric(horizontal: widget.padding);
  }

  @override
  Widget build(BuildContext context) {
    mobile = widget.projects
        .where((e) => e.projectType?.toLowerCase() == 'mobile')
        .toList();
    web = widget.projects
        .where((e) => e.projectType?.toLowerCase() == 'web')
        .toList();
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SectionsTitleWidget(
              key: GlobalKeys.projects,
              title: Strings.projects.translate,
            ).expand,
            CustomZaraButton(
                active: selectedIndex == 0,
                title: 'ALL',
                icon: Icons.folder_open_outlined,
                onTap: () {
                  onUpdateIndex(0);
                }),
            8.0.widthBox,
            CustomZaraButton(
                active: selectedIndex == 1,
                title: 'Mobile',
                icon: Portfolio.phone,
                onTap: () {
                  onUpdateIndex(1);
                }),
            8.0.widthBox,
            CustomZaraButton(
                active: selectedIndex == 2,
                title: 'Web',
                icon: Portfolio.web,
                onTap: () {
                  onUpdateIndex(2);
                }),
          ],
        ).paddingSymmetric(horizontal: widget.padding),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          key: ValueKey(selectedIndex),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: getChild(),
        ),
      ],
    );
  }
}
