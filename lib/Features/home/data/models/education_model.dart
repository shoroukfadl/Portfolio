import '../../domain/entities/education_entity.dart';

class EducationModel {
  final String? id;
  final String? userId;
  final String? degree;
  final String? fieldOfStudy;
  final String? institution;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isCurrent;
  final double? gpa;
  final String? description;
  final String? icon;
  final int displayOrder;

  EducationModel({
    this.id,
    this.userId,
    this.degree,
    this.fieldOfStudy,
    this.institution,
    this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.gpa,
    this.description,
    this.displayOrder = 0, this.icon,
  });

  // من JSON إلى Model
  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      id: json['id'] as String?,
      icon: json['icon'] as String?,
      userId: json['user_id'] as String?,
      degree: json['degree'] as String?,
      fieldOfStudy: json['field_of_study'] as String?,
      institution: json['institution'] as String?,
      startDate: json['start_date'] != null ? DateTime.parse(json['start_date']) : null,
      endDate: json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      isCurrent: json['is_current'] ?? false,
      gpa: json['gpa'] != null ? double.tryParse(json['gpa'].toString()) : null,
      description: json['description'] as String?,
      displayOrder: json['display_order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'user_id': userId,
      'degree': degree,
      'field_of_study': fieldOfStudy,
      'institution': institution,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'is_current': isCurrent,
      'gpa': gpa,
      'description': description,
      'display_order': displayOrder,
      'icon':icon
    };
  }

  factory EducationModel.fromEntity(EducationEntity entity) {
    return EducationModel(
      id: entity.id,
      userId: entity.userId,
      degree: entity.degree,
      fieldOfStudy: entity.fieldOfStudy,
      institution: entity.institution,
      startDate: entity.startDate,
      endDate: entity.endDate,
      isCurrent: entity.isCurrent,
      gpa: entity.gpa,
      description: entity.description,
      displayOrder: entity.displayOrder,
      icon: entity.icon,
    );
  }

  EducationEntity toEntity() {
    return EducationEntity(
      id: id,
      userId: userId,
      degree: degree,
      icon: icon,
      fieldOfStudy: fieldOfStudy,
      institution: institution,
      startDate: startDate,
      endDate: endDate,
      isCurrent: isCurrent,
      gpa: gpa,
      description: description,
      displayOrder: displayOrder,
    );
  }
}