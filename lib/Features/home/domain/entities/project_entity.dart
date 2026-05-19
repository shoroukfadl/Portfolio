import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final List<String> images;
  final String? company;
  final String? profileId;
  final String? id;
  final String? industry;
  final String? cover;
  final List<LinkEntity> iosLinks;
  final List<LinkEntity> webLinks;
  final List<LinkEntity> androidLinks;
  final String? projectName;
  final String? projectType;
  final List<String> technicalTools;
  final List<String> content;

  ProjectEntity({
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
    this.androidLinks = const [],
    this.content = const [],
    this.cover,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        profileId,
        projectName,
        projectType,
        technicalTools,
        androidLinks,
        iosLinks,
        webLinks,
        images,
        company,
        industry,
        content,
    cover
      ];
}

class LinkEntity extends Equatable {
  final String? url;
  final String? name;

  LinkEntity({
    this.url,
    this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [url, name];
}
