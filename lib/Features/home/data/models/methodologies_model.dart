import '../../domain/entities/methodologies_entity.dart';

class MethodologyModel {
  final String? id;
  final String? profileId;
  final String? category;
  final String? conceptName;

  MethodologyModel({
    this.id,
    this.profileId,
    this.category,
    this.conceptName,
  });

  factory MethodologyModel.fromJson(Map<String, dynamic> json) =>
      MethodologyModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        category: json['category'],
        conceptName: json['concept_name'],
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'concept_name': conceptName,
      };

  MethodologyModel toModel() => MethodologyModel(
        id: id,
        profileId: profileId,
        category: category,
        conceptName: conceptName,
      );
  MethodologyEntity fromModel() => MethodologyEntity(
        id: id,
        profileId: profileId,
        category: category,
        conceptName: conceptName,
      );
}
