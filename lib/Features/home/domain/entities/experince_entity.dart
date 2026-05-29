import 'package:equatable/equatable.dart';

class ExperienceEntity extends Equatable {
  final String? id;
  final String? userId;
  final String? positionTitle;
  final String? companyName;
  final String? employmentType;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isCurrent; // Non-optional
  final String? location;
  final List<String> description;
  final String? seniorityLevel;
  final int? displayOrder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ExperienceEntity({
    this.id,
    this.userId,
    this.positionTitle,
    this.companyName,
    this.employmentType,
    this.startDate,
    this.endDate,
    this.isCurrent = false,
    this.location,
    this.description = const [],
    this.seniorityLevel,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        positionTitle,
        companyName,
        employmentType,
        startDate,
        endDate,
        isCurrent,
        location,
        description,
        seniorityLevel,
        displayOrder,
        createdAt,
        updatedAt,
      ];
}
