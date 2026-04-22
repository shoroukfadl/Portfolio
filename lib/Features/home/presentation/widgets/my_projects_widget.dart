import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/curved_card_widget.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

import '../../../../Core/Language/app_styles.dart';
import '../../../../Models/user_data_model.dart';
import '../../../../Utilities/Constants/global_keys.dart';
import '../../../../Utilities/Constants/strings.dart';
import '../../../../Widgets/sections_title_widget.dart';

class MyProjectsWidget extends StatelessWidget {
  final List<ProjectModel> projects;

  final TextStyle? myStyle, titleStyle;

  const MyProjectsWidget(
      {super.key, this.projects = const [], this.myStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        SectionsTitleWidget(
          key: GlobalKeys.projects,
          title: Strings.projects.translate,
          titleStyle: titleStyle,
          myStyle: myStyle,
        ),
        16.0.heightBox,
        SizedBox(
          height: 460,
          child: ListView.separated(
            itemBuilder: (context, i) => ProjectItemCard(
              left: i % 2 == 0,
              project: projects[i],
              index: i + 1,
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => 32.0.heightBox,
            itemCount: projects.length,
          ),
        )
      ],
    );
  }
}

class ProjectItemCard extends StatelessWidget {
  final bool left;
  final ProjectModel? project;
  final int index;

  const ProjectItemCard({
    super.key,
    this.left = false,
    this.project,
    required this.index,
    this.imageWidthSize = 416,
    this.imageHeightSize = 307,
    this.indexStyle,
    this.projectNameStyle,
    this.projectTypeStyle,
    this.descriptionStyle,
  });

  final TextStyle? indexStyle,
      projectNameStyle,
      projectTypeStyle,
      descriptionStyle;
  final double imageWidthSize, imageHeightSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return CurvedCardWidget(
      child: Container(
        padding: EdgeInsets.zero,
        width: imageWidthSize,
        height: imageHeightSize + 160,
        color: Colors.white.withValues(alpha: 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                project?.projectName ?? "",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: (projectNameStyle ?? AppTextStyles.extraBold32())
                    .copyWith(color: colors.textPrimary),
              ).paddingSymmetric(horizontal: 20),
            ),
            Divider(
              color: colors.border,
              thickness: 1,
            ),
            Row(
              children: [
                Text(
                  project?.projectType ?? "",
                  style:
                      AppTextStyles.medium10().copyWith(color: colors.textPrimary),
                ),
              ],
            ).paddingSymmetric(horizontal: 20),
            Text(
              project?.description ?? "",
              style: AppTextStyles.medium10().copyWith(color: colors.textPrimary),
            ).paddingSymmetric(horizontal: 20),
            ClipPath(
              clipper: SmoothNotchedClipper(),
              child: RoundedImage(
                imagePath: project?.images?.firstOrNull ?? "",
                height: imageHeightSize,
                width: imageWidthSize,
                radiusValue: 16,
                radius: 0,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}

/*
* Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Testing Reports',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkMode ? const Color(0xFF00D4FF) : Colors.cyan[700],
            ),
          ),
          const SizedBox(height: 16),
          ...projects.asMap().entries.map((entry) {
            final idx = entry.key;
            final project = entry.value;
            final isSelected = selectedProjectIndex == idx;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => setState(
                    () => selectedProjectIndex = isSelected ? null : idx),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: darkMode
                          ? const Color(0xFF00D4FF).withOpacity(0.3)
                          : Colors.cyan[300]!.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: darkMode
                        ? Colors.white.withOpacity(0.05)
                        : Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project['name']?.toString()??'',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: darkMode
                                    ? const Color(0xFF00D4FF)
                                    : Colors.cyan[700],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Bugs Found',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.red,
                                          ),
                                        ),
                                        Text(
                                          '${project['bugs']}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Test Cases',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          '${project['tests']}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.purple.withOpacity(0.2),
                                  foregroundColor: Colors.purple[200],
                                  elevation: 0,
                                ),
                                onPressed: () => setState(() =>
                                    selectedProjectIndex =
                                        isSelected ? null : idx),
                                child: Text(
                                    'View Found Bugs (${project['bugs']})'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: darkMode
                                    ? const Color(0xFF00D4FF).withOpacity(0.3)
                                    : Colors.cyan[300]!.withOpacity(0.3),
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Defect Report',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: darkMode
                                      ? Colors.cyan[300]
                                      : Colors.cyan[700],
                                ),
                              ),
                              const SizedBox(height: 12),
                              ...((project['bugs_found'] as List<Map>)
                                  .map((bug) {
                                final severityColor =
                                    bug['severity'] == 'Critical'
                                        ? Colors.red
                                        : bug['severity'] == 'High'
                                            ? Colors.orange
                                            : Colors.yellow;
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: severityColor,
                                          width: 3,
                                        ),
                                      ),
                                      color: darkMode
                                          ? Colors.white.withOpacity(0.05)
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bug['id'],
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'monospace',
                                            color: Colors.white54,
                                          ),
                                        ),
                                        Text(
                                          bug['title'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: darkMode
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '✓ ${bug['status']}',
                                          style: const TextStyle(
                                            fontSize: 11,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList()),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    )*/