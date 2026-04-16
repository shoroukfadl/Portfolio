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
      skillTitle: json['skillTitle'] as String?,
      skills: (json['skills'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SkillModelToJson(SkillModel instance) =>
    <String, dynamic>{
      'skillTitle': instance.skillTitle,
      'skills': instance.skills,
    };

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) =>
    ExperienceModel(
      companyName: json['companyName'] as String?,
      date: json['date'] as String?,
      description: json['description'] as String?,
      companyLocation: json['companyLocation'] as String?,
      companyUrl: json['companyUrl'] as String?,
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$ExperienceModelToJson(ExperienceModel instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'date': instance.date,
      'description': instance.description,
      'companyUrl': instance.companyUrl,
      'roleName': instance.roleName,
      'companyLocation': instance.companyLocation,
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
      uniName: json['uniName'] as String?,
      country: json['country'] as String?,
      link: json['link'] as String?,
      date: json['date'] as String?,
      desc: json['desc'] as String?,
    );

Map<String, dynamic> _$EductionModelToJson(EductionModel instance) =>
    <String, dynamic>{
      'uniName': instance.uniName,
      'country': instance.country,
      'link': instance.link,
      'date': instance.date,
      'desc': instance.desc,
    };
