import 'package:portfolio/Features/home/domain/entities/project_entity.dart';

class ProjectModel {
  final List<String> images;
  final String? company;
  final String? profileId;
  final String? id;
  final String? industry;
  final List<LinkModel> iosLinks;
  final List<LinkModel> webLinks;
  final List<LinkModel> androidLinks;
  final String? projectName;
  final String? projectType;
  final List<String> content;
  final List<String> technicalTools;

  ProjectModel({
    this.id,
    this.profileId,
    this.projectName,
    this.projectType,
    this.technicalTools = const [],
    this.images = const [],
    this.company,
    this.industry,
    this.iosLinks = const [],
    this.webLinks = const [],
    this.content = const [],
    this.androidLinks = const [],
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json['project_id']?.toString(),
        profileId: json['profile_id'],
        projectName: json['project_name'],
        projectType: json['project_type'],
        technicalTools: List<String>.from(json['technical_tools'] ?? []),
        androidLinks: json['android_links'] == null
            ? []
            : (json['android_links'] as List)
                .map((e) => LinkModel.fromJson(e))
                .toList(),
        iosLinks: json['ios_links'] == null
            ? []
            : (json['ios_links'] as List)
                .map((e) => LinkModel.fromJson(e))
                .toList(),
        webLinks: json['web_links'] == null
            ? []
            : (json['web_links'] as List)
                .map((e) => LinkModel.fromJson(e))
                .toList(),
        content: List<String>.from(json['content'] ?? []),
        images: List<String>.from(json['images'] ?? []),
        company: json['company'],
        industry: json['industry'],
      );

  ProjectModel toModel() => ProjectModel(
      id: id,
      profileId: profileId,
      projectName: projectName,
      projectType: projectType,
      technicalTools: technicalTools,
      androidLinks: androidLinks,
      iosLinks: iosLinks,
      webLinks: webLinks,
      images: images,
      company: company,
      industry: industry,
      content: content);

  ProjectEntity fromModel() => ProjectEntity(
        id: id,
        profileId: profileId,
        projectName: projectName,
        projectType: projectType,
        technicalTools: technicalTools,
        androidLinks: androidLinks.map((e) => e.toEntity()).toList(),
        iosLinks: iosLinks.map((e) => e.toEntity()).toList(),
        webLinks: webLinks.map((e) => e.toEntity()).toList(),
        images: images,
        company: company,
        industry: industry,
        content: content,
      );
}

class LinkModel {
  final String? url;
  final String? name;

  const LinkModel({this.url, this.name});

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      LinkModel(url: json['url'], name: json['name']);

  LinkModel toModel(LinkEntity entity) =>
      LinkModel(url: entity.url, name: entity.name);

  LinkEntity toEntity() => LinkEntity(url: url, name: name);
}
