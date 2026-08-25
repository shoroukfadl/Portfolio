import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/projects_frame.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatefulWidget {
  final List<ProjectEntity> projects;
  final double imageWidth;
  final double mainAxisExtent;
  final double padding;
  final int perRow;

  const MyProjectsWidget({
    super.key,
    this.mainAxisExtent = 360,
    this.projects = const [],
    this.perRow = 4,
    this.imageWidth = 100,
    this.padding = desktopHozPadding,
  });

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  late Map<String, List<ProjectEntity>> items;

  @override
  void initState() {
    super.initState();
    items = _groupProjectsByCompany();
  }

  Map<String, List<ProjectEntity>> _groupProjectsByCompany() {
    final result = <String, List<ProjectEntity>>{};

    for (final project in widget.projects) {
      final company = project.company?.trim();

      if (company == null || company.isEmpty) continue;

      result.putIfAbsent(company, () => []).add(project);
    }

    return result;
  }

  @override
  void didUpdateWidget(covariant MyProjectsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.projects != widget.projects) {
      items = _groupProjectsByCompany();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          index: 4,
          title: Strings.projects.translate,
        ),
        ProjectsFrame(
          items: items,
        ),
      ],
    ).paddingSymmetric(
      horizontal: widget.padding,
    );
  }
}
