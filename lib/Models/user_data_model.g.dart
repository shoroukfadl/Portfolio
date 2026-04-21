// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      project: (json['project'] as List<dynamic>?)
              ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      email: json['email'] as String?,
      cv: json['cv'] as String?,
      summary: json['summary'] as String?,
      experience: (json['experience'] as List<dynamic>?)
              ?.map((e) => ExperienceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      linkedIn: json['linkedIn'] as String?,
      github: json['github'] as String?,
      name: json['name'] as String?,
      jobName: json['jobName'] as String?,
      location: json['location'] as String?,
      eduction: json['eduction'] == null
          ? null
          : EductionModel.fromJson(json['eduction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'skills': instance.skills,
      'project': instance.project,
      'email': instance.email,
      'linkedIn': instance.linkedIn,
      'github': instance.github,
      'cv': instance.cv,
      'name': instance.name,
      'jobName': instance.jobName,
      'location': instance.location,
      'summary': instance.summary,
      'experience': instance.experience,
      'eduction': instance.eduction,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      linkedIn: json['linkedIn'] as String?,
      email: json['email'] as String?,
      cv: json['cv'] as String?,
      github: json['github'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'linkedIn': instance.linkedIn,
      'email': instance.email,
      'cv': instance.cv,
      'github': instance.github,
    };

SkillModel _$SkillModelFromJson(Map<String, dynamic> json) => SkillModel(
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
      'description': instance.description,
    };

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    ExperienceModel(
      position: json['position'] as String?,
      company: json['company'] as String?,
      duration: json['duration'] as String?,
      description: json['description'] as String?,
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      technologies: (json['technologies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      icon: json['icon'] as String?,
      color: (json['color'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'position': instance.position,
      'company': instance.company,
      'duration': instance.duration,
      'description': instance.description,
      'achievements': instance.achievements,
      'technologies': instance.technologies,
      'icon': instance.icon,
      'color': instance.color,
    };

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      companyName: json['companyName'] as String?,
      description: json['description'] as String?,
      projectName: json['projectName'] as String?,
      link: json['link'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      projectType: json['projectType'] as String?,
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'description': instance.description,
      'projectName': instance.projectName,
      'link': instance.link,
      'projectType': instance.projectType,
      'images': instance.images,
    };

EductionModel _$EductionModelFromJson(Map<String, dynamic> json) =>
    EductionModel(
      degree: json['degree'] as String?,
      field: json['field'] as String?,
      institution: json['institution'] as String?,
      year: json['year'] as String?,
      description: json['description'] as String?,
      details: json['details'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$EductionModelToJson(EductionModel instance) =>
    <String, dynamic>{
      'degree': instance.degree,
      'field': instance.field,
      'institution': instance.institution,
      'year': instance.year,
      'description': instance.description,
      'details': instance.details,
      'icon': instance.icon,
    };
