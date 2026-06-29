import 'package:portfolio/Features/home/data/models/education_model.dart';
import 'package:portfolio/Features/home/data/models/profile_model.dart';
import 'package:portfolio/Features/home/data/models/project_model.dart';
import 'package:portfolio/Features/home/data/models/tech_skill_model.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import 'experince_model.dart';

class PortfolioModel {
  final ProfileModel? profile;
  final List<EducationModel> education;
  final List<ExperienceModel> experience;
  final List<ProjectModel> projects;
  final List<TechnicalSkillModel> skills;

  PortfolioModel({
    this.profile,
    this.education = const [],
    this.projects = const [],
    this.experience = const [],
    this.skills = const [],
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile']),
      education: json['education'] == null
          ? []
          : (json['education'] as List)
              .map((e) => EducationModel.fromJson(e))
              .toList(),
      projects: json['projects'] == null
          ? []
          : (json['projects'] as List)
              .map((e) => ProjectModel.fromJson(e))
              .toList(),
      experience: json['experience'] == null
          ? []
          : (json['experience'] as List)
              .map((e) => ExperienceModel.fromJson(e))
              .toList(),
      skills: json['skills'] == null
          ? []
          : (json['skills'] as List)
              .map((e) => TechnicalSkillModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toFullJson() => {
        'profile_id': profile?.id,
        'profile': profile?.toJson(),
        'education': education.map((e) => e.toJson()).toList(),
        'experience': experience.map((e) => e.toJson()).toList(),
        'projects': projects.map((e) => e.toJson()).toList(),
        'skills': skills.map((e) => e.toJson()).toList(),
      };

  PortfolioEntity fromModel() => PortfolioEntity(
        profile: profile?.toEntity(),
        education: education.map((e) => e.toEntity()).toList(),
        projects: projects.map((e) => e.fromModel()).toList(),
        experience: experience.map((e) => e.toEntity()).toList(),
        skills: skills.map((e) => e.toEntity()).toList(),
      );

  static PortfolioModel toModel(PortfolioEntity? pr) => PortfolioModel(
        profile: ProfileModel.toModel(pr?.profile),
        education:
            pr?.education.map((e) => EducationModel.toModel(e)).toList() ?? [],
        projects:
            pr?.projects.map((e) => ProjectModel.toModel(e)).toList() ?? [],
        experience:
            pr?.experience.map((e) => ExperienceModel.toModel(e)).toList() ??
                [],
        skills:
            pr?.skills.map((e) => TechnicalSkillModel.toModel(e)).toList() ??
                [],
      );
}
