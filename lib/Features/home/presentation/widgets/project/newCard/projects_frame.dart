import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/newCard/project_content.dart';
import 'package:portfolio/Features/home/presentation/widgets/project/projects_side_item_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';

class ProjectsFrame extends StatefulWidget {
  final Map<String, List<ProjectEntity>> items;

  const ProjectsFrame({super.key, required this.items});

  @override
  State<ProjectsFrame> createState() => _ProjectsFrameState();
}

class _ProjectsFrameState extends State<ProjectsFrame> {
  late ProjectEntity selectedProject;
  @override
  void initState() {
    super.initState();
    selectedProject = widget.items.entries.first.value.first;
  }

  void _onProjectTap(ProjectEntity project) {
    setState(() {
      selectedProject = project;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CardWidget(
      cardColor: colors.background,
      borderColor: colors.text3,
      paddingVert: 0,
      paddingHoz: 0,
      height: 600,
      child: context.isLarge ? LargePreview() : SmallPreview(),
    );
  }

  Widget LargePreview() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectsSideListWidget(
            items: widget.items,
            selectedProject: selectedProject,
            onTapProject: (p) => _onProjectTap(p),
          ).expand,
          Expanded(
            flex: 3,
            child: ProjectContentWidget(selectedProject: selectedProject),
          ),
        ],
      );
  Widget SmallPreview() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectsSideListWidget(
            items: widget.items,
            selectedProject: selectedProject,
            onTapProject: (p) => _onProjectTap(p),
          ).expand,
          Expanded(
            flex: 3,
            child: ProjectContentWidget(selectedProject: selectedProject),
          ),
        ],
      );
}
