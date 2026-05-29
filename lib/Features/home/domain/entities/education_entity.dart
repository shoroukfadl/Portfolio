import 'package:equatable/equatable.dart';

class EducationEntity extends Equatable {
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
  final int displayOrder;
  final String? icon;

  const EducationEntity({
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
    this.displayOrder = 0,
    this.icon,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        degree,
        fieldOfStudy,
        institution,
        startDate,
        endDate,
        isCurrent,
        gpa,
        description,
        displayOrder,
        icon
      ];
}
