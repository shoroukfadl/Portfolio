import '../../domain/entities/experince_entity.dart';

class ExperienceModel {
  final String? id;
  final String? userId;
  final String? positionTitle;
  final String? companyName;
  final String? employmentType;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isCurrent;
  final String? location;
  final List<String> description;
  final String? seniorityLevel;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ExperienceModel({
    this.id,
    this.userId,
    this.positionTitle,
    this.companyName,
    this.employmentType,
    this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.location,
    this.description=const[],
    this.seniorityLevel,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  // Convert Model to Entity
  ExperienceEntity toEntity() {
    return ExperienceEntity(
      id: id,
      userId: userId,
      positionTitle: positionTitle,
      companyName: companyName,
      employmentType: employmentType,
      startDate: startDate,
      endDate: endDate,
      isCurrent: isCurrent,
      location: location,
      description: description,
      seniorityLevel: seniorityLevel,
      displayOrder: displayOrder,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // Convert Entity to Model (Static factory)
  factory ExperienceModel.fromEntity(ExperienceEntity entity) {
    return ExperienceModel(
      id: entity.id,
      userId: entity.userId,
      positionTitle: entity.positionTitle,
      companyName: entity.companyName,
      employmentType: entity.employmentType,
      startDate: entity.startDate,
      endDate: entity.endDate,
      isCurrent: entity.isCurrent,
      location: entity.location,
      description: entity.description,
      seniorityLevel: entity.seniorityLevel,
      displayOrder: entity.displayOrder,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // JSON Mapping for Supabase
  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'],
      userId: json['user_id'],
      positionTitle: json['position_title'],
      companyName: json['company_name'],
      employmentType: json['employment_type'],
      startDate: json['start_date'] != null ? DateTime.parse(json['start_date']) : null,
      endDate: json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      isCurrent: json['is_current'] ?? false,
      location: json['location'],
      description: json['description'] == null? []: List<String>.from((json['description']??[])),
      seniorityLevel: json['seniority_level'],
      displayOrder: json['display_order'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'position_title': positionTitle,
      'company_name': companyName,
      'employment_type': employmentType,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'is_current': isCurrent,
      'location': location,
      'description': description,
      'seniority_level': seniorityLevel,
      'display_order': displayOrder,
    };
  }
}