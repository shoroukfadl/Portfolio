import 'package:portfolio/Features/home/domain/entities/project_entity.dart';

class ProjectModel {
  final String? id;
  final String? profileId;
  final String? title;
  final String? projectType;
  final String? platform;
  final List<String> keyTasks;
  final bool isManual;

  ProjectModel({
    this.id,
    this.profileId,
    this.title,
    this.projectType,
    this.platform,
    this.keyTasks = const [],
    this.isManual = false,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        title: json['title'],
        projectType: json['project_type'],
        platform: json['platform'],
        keyTasks: List<String>.from(json['key_tasks'] ?? []),
        isManual: json['manual'] ?? true,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'project_type': projectType,
        'platform': platform,
        'key_tasks': keyTasks,
        'manual': isManual,
      };

  ProjectModel toModel() => ProjectModel(
        id: id,
        profileId: profileId,
        title: title,
        projectType: projectType,
        platform: platform,
        keyTasks: keyTasks,
        isManual: isManual,
      );
  ProjectEntity fromModel() => ProjectEntity(
        id: id,
        profileId: profileId,
        title: title,
        projectType: projectType,
        platform: platform,
        keyTasks: keyTasks,
        isManual: isManual,
      );
}
