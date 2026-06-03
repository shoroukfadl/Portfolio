import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';

class TechnicalSkillModel {
  final String? category;
  final int? id;
  final List<SkillModel> skills;

  TechnicalSkillModel({
    this.category,
    this.skills = const [],
    this.id,
  });

  factory TechnicalSkillModel.fromJson(Map<String, dynamic> json) =>
      TechnicalSkillModel(
        category: json['category'],
        skills: json['skills'] == null
            ? []
            : (json['skills'] as List)
                .map((e) => SkillModel.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'skill_name': skills,
      };

  TechnicalSkillModel toModel() => TechnicalSkillModel(
        category: category,
        skills: skills,
      );
  TechnicalSkillEntity toEntity() => TechnicalSkillEntity(
        category: category,
        skills: skills.map((e) => e.toEntity()).toList(),
      );
}

class SkillModel {
  final String? id;
  final String? profileId;
  final String? category;
  final String? skillName;

  SkillModel({
    this.id,
    this.profileId,
    this.category,
    this.skillName,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        category: json['category'],
        skillName: json["name"] == null ? null : json['name'],
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'skill_name': skillName,
      };

  SkillModel toModel() => SkillModel(
        id: id,
        profileId: profileId,
        category: category,
        skillName: skillName,
      );
  SkillEntity toEntity() => SkillEntity(
        id: id,
        profileId: profileId,
        category: category,
        skillName: skillName,
      );
}
