import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';

class TechnicalSkillModel {
  final String? category;
  final String? id;
  final int? order;
  final String? icon;
  final List<SkillModel> skills;

  TechnicalSkillModel({
    this.category,
    this.skills = const [],
    this.id,
    this.icon,
    this.order,
  });

  factory TechnicalSkillModel.fromJson(Map<String, dynamic> json) =>
      TechnicalSkillModel(
        category: json['category'],
        id: json['id'],
        icon: json['icon'],
        order: json['display_order'],
        skills: json['skills'] == null
            ? []
            : (json['skills'] as List)
                .map((e) => SkillModel.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'skills': skills,
        'id': id,
        'icon': icon,
        'order': order
      };

  TechnicalSkillModel toModel() => TechnicalSkillModel(
        category: category,
        skills: skills,
        icon: icon,
        id: id,
        order: order,
      );

  TechnicalSkillEntity toEntity() => TechnicalSkillEntity(
        category: category,
        icon: icon,
        id: id,
        order: order,
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
