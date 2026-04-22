import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';

class TechnicalSkillModel {
  final String? id;
  final String? profileId;
  final String? category;
  final List<String> skillName;

  TechnicalSkillModel({
    this.id,
    this.profileId,
    this.category,
    this.skillName=const[],
  });

  factory TechnicalSkillModel.fromJson(Map<String, dynamic> json) =>
      TechnicalSkillModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        category: json['category'],
        skillName: json['skill_name'] == null ? [] : List<String>.from(json['skill_name']),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'skill_name': skillName,
      };

  TechnicalSkillModel toModel() => TechnicalSkillModel(
        id: id,
        profileId: profileId,
        category: category,
        skillName: skillName,
      );
  TechnicalSkillEntity toEntity() => TechnicalSkillEntity(
        id: id,
        profileId: profileId,
        category: category,
        skillName: skillName,
      );
}
