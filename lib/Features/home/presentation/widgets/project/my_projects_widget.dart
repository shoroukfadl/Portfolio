import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
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
  final int perRow;
  final double imageWidth, mainAxisExtent;

  const MyProjectsWidget(
      {super.key,
      this.mainAxisExtent = 360,
      this.projects = const [],
      this.imageWidth = 100,
      this.perRow = 4});

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  int selectedIndex = 0;
  late List<ProjectEntity> mobile, web;

  void onUpdateIndex(int index)=> setState(() {
    selectedIndex = index;
  });
  @override
  Widget build(BuildContext context) {
    mobile = widget.projects.where((e) => e.projectType?.toLowerCase() == 'mobile').toList();
    web = widget.projects.where((e) => e.projectType?.toLowerCase() == 'web').toList();
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
            CustomZaraButton(active:selectedIndex==0,title: 'ALL',icon: Icons.folder_open_outlined, onTap: () {onUpdateIndex(0);}),
            8.0.widthBox,
            CustomZaraButton(active:selectedIndex==1,title:'Mobile',icon: Portfolio.phone, onTap: () {onUpdateIndex(1);}),
            8.0.widthBox,
            CustomZaraButton(active:selectedIndex==2,title:'Web',icon: Icons.language_outlined, onTap: () {onUpdateIndex(2);}),
          ],
        ),
        if(selectedIndex==0)
        AnimatedGridView<ProjectEntity>(
            perRow: widget.perRow,
            mainAxisExtent: widget.mainAxisExtent,
            items: widget.projects,
            buildChild: (i) => ProjectCard(project: widget.projects[i])
                .paddingSymmetric(horizontal: 8, vertical: 8))
        else if(selectedIndex ==1)
        AnimatedGridView<ProjectEntity>(
            perRow: widget.perRow,
            mainAxisExtent: widget.mainAxisExtent,
            items: mobile,
            buildChild: (i) => ProjectCard(project: mobile[i])
                .paddingSymmetric(horizontal: 8, vertical: 8))

        else if(selectedIndex ==2)
            AnimatedGridView<ProjectEntity>(
                perRow: widget.perRow,
                mainAxisExtent: widget.mainAxisExtent,
                items: web,
                buildChild: (i) => ProjectCard(project: web[i])
                    .paddingSymmetric(horizontal: 8, vertical: 8))
      ],
    );
  }
}
