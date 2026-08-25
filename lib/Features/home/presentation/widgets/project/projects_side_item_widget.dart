import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_floating_title.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class ProjectsSideListWidget extends StatelessWidget {
  final Map<String, List<ProjectEntity>> items;
  final void Function(ProjectEntity) onTapProject;
  final ProjectEntity selectedProject;

  const ProjectsSideListWidget(
      {super.key,
      required this.items,
      required this.onTapProject,
      required this.selectedProject});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CardWidget(
      paddingHoz: 0,
      borderR: BorderRadiusDirectional.only(
        topStart: Radius.circular(cardRadius),
        bottomStart: Radius.circular(cardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: items.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Row(
                spacing: 8,
                children: [
                  Icon(
                    Icons.folder_rounded,
                    color: colors.warning,
                    size: 16,
                  ),
                  Expanded(
                    child: Text(
                      entry.key,
                      style: AppTextStyles.titleCardSmall(
                        context: context,
                        color: colors.text2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: entry.value.map(
                  (project) {
                    return ProjectSideItemWidget(
                      key: ValueKey(project.id),
                      project: project,
                      onTapProject: () => onTapProject(project),
                      isSelected: project.id == selectedProject.id,
                    );
                  },
                ).toList(),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class ProjectSideItemWidget extends StatefulWidget {
  final ProjectEntity project;
  final void Function() onTapProject;
  final bool isSelected;
  const ProjectSideItemWidget({
    super.key,
    required this.project,
    required this.onTapProject,
    this.isSelected = false,
  });

  @override
  State<ProjectSideItemWidget> createState() => _ProjectSideItemWidgetState();
}

class _ProjectSideItemWidgetState extends State<ProjectSideItemWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final projectType = widget.project.projectType?.trim().toLowerCase() ?? '';
    final typeColor =
        projectType == 'mobile' ? colors.accent : colors.secondary;
    final projectName = widget.project.projectName?.trim() ?? '';

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTapProject,
        child: AnimatedContainer(
          height: 32,
          duration: const Duration(milliseconds: 180),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? colors.background
                  : isHovered
                      ? colors.text3.withValues(alpha: 0.3)
                      : Colors.transparent,
              border: widget.isSelected
                  ? BoxBorder.fromSTEB(
                      start: BorderSide(color: typeColor, width: 2))
                  : null),
          child: Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  '${projectName.replaceAll(' ', '_')}.dart',
                  style: AppTextStyles.cardBody(
                    context: context,
                    color: widget.isSelected ? colors.text1 : colors.text3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (projectType.isNotEmpty)
                CardWithText(
                  hozPadding: 0,
                  vertPadding: 0,
                  style: AppTextStyles.cardBody(
                    context: context,
                    color: typeColor,
                  ).copyWith(
                    fontSize: 8,
                  ),
                  border: 4,
                  text: projectType,
                  borderColor: Colors.transparent,
                  color: typeColor.withValues(alpha: 0.1),
                  textColor: typeColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
