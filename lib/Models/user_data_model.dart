import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  final List<SkillModel> skills;
  final List<ProjectModel> project;
  final String? email;
  final String? linkedIn;
  final String? github;
  final String? cv;
  final String? name;
  final String? jobName;
  final String? location;
  final String? summary;
  final List<ExperienceModel> experience;
  final EductionModel? eduction;

  UserDataModel({
    this.skills = const [],
    this.project = const [],
    this.email,
    this.cv,
    this.summary,
    this.experience = const [],
    this.linkedIn,
    this.github,
    this.name,
    this.jobName,
    this.location,
    this.eduction,
  });

  UserDataModel copyWith({
    List<SkillModel>? skills,
    List<ProjectModel>? project,
    String? email,
    String? cv,
    List<ExperienceModel>? experience,
  }) =>
      UserDataModel(
        skills: skills ?? this.skills,
        project: project ?? this.project,
        email: email ?? this.email,
        cv: cv ?? this.cv,
        experience: experience ?? this.experience,
      );

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class Links {
  final String? linkedIn;
  final String? email;
  final String? cv;
  final String? github;

  Links({
    this.linkedIn,
    this.email,
    this.cv,
    this.github,
  });

  Links copyWith({
    String? linkedIn,
    String? email,
    String? cv,
    String? github,
  }) =>
      Links(
        linkedIn: linkedIn ?? this.linkedIn,
        email: email ?? this.email,
        cv: cv ?? this.cv,
        github: github ?? this.github,
      );

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class SkillModel {
  final String? title;
  final String? icon;
  final String? description;

  SkillModel({
    this.title, this.icon,  this.description,
  });

  SkillModel copyWith({
    String? title,
    String? icon,
    String? description,
  }) =>
      SkillModel(
        title: title??this.title,
        icon: icon??this.icon,
        description: description??this.description
      );

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$SkillModelToJson(this);
}

@JsonSerializable()
class ExperienceModel {
  final String? companyName;
  final String? date;
  final String? description;
  final String? companyUrl;
  final String? roleName;
  final String? companyLocation;

  ExperienceModel({
    this.companyName,
    this.date,
    this.description,
    this.companyLocation,
    this.companyUrl,
    this.roleName,
  });

  ExperienceModel copyWith({
    String? companyName,
    String? date,
    String? description,
    String? companyUrl,
    String? roleName,
    String? companyLocation,
  }) =>
      ExperienceModel(
          companyName: companyName ?? this.companyName,
          date: date ?? this.date,
          description: description ?? this.description,
          companyUrl: companyUrl ?? this.companyUrl,
          roleName: roleName ?? this.roleName,
          companyLocation: companyLocation ?? this.companyLocation);

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceModelToJson(this);
}

@JsonSerializable()
class ProjectModel {
  final String? companyName;
  final String? description;
  final String? projectName;
  final String? link;
  final String? projectType;
  final List<String> images;

  ProjectModel({
    this.companyName,
    this.description,
    this.projectName,
    this.link,
    this.images = const [],
    this.projectType,
  });

  ProjectModel copyWith({
    String? companyName,
    String? description,
    String? projectName,
    String? link,
    String? projectType,
    List<String>? images,
  }) =>
      ProjectModel(
          companyName: companyName ?? this.companyName,
          description: description ?? this.description,
          projectName: projectName ?? this.projectName,
          link: link ?? this.link,
          projectType: projectType ?? this.projectType,
          images: images ?? this.images);

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}

@JsonSerializable()
class EductionModel {
  final String? uniName;
  final String? country;
  final String? link;
  final String? date;
  final String? desc;

  EductionModel({
    this.uniName,
    this.country,
    this.link,
    this.date,
    this.desc,
  });

  EductionModel copyWith({
    String? uniName,
    String? country,
    String? link,
    String? date,
    String? desc,
  }) =>
      EductionModel(
        uniName: uniName ?? this.uniName,
        country: country ?? this.country,
        link: link ?? this.link,
        date: date ?? this.date,
        desc: desc ?? this.desc,
      );

  factory EductionModel.fromJson(Map<String, dynamic> json) =>
      _$EductionModelFromJson(json);

  Map<String, dynamic> toJson() => _$EductionModelToJson(this);
}
