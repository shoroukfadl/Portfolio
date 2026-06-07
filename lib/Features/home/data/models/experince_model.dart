import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';

class ExperienceModel {
  final String? id;
  final String? profileId;
  final String? jobTitle;
  final String? companyName;
  final String? location;
  final bool status;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> responsibilities;

  ExperienceModel(
      {this.id,
      this.profileId,
      this.jobTitle,
      this.companyName,
      this.location,
      this.startDate,
      this.responsibilities = const [],
      this.status = false, this.endDate});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        jobTitle: json['job_title'],
        companyName: json['company_name'],
        location: json['location'],
        startDate: json['startDate'] ==null?null:DateTime.tryParse( json['startDate']),
        endDate: json['end_date'] ==null?null:DateTime.tryParse( json['end_date']),
        status: json['status'] ?? false,
        responsibilities: List<String>.from(json['responsibilities'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        'job_title': jobTitle,
        'company_name': companyName,
        'location': location,
        'endDate': endDate,
    'startDate':startDate,
        'responsibilities': responsibilities,
      };

  ExperienceModel toModel() => ExperienceModel(
      id: id,
      profileId: profileId,
      jobTitle: jobTitle,
      companyName: companyName,
      location: location,
      startDate: startDate,
      endDate: endDate,
      responsibilities: responsibilities,
      status: status);
  ExperienceEntity fromModel() => ExperienceEntity(
        id: id,
        profileId: profileId,
        jobTitle: jobTitle,
        companyName: companyName,
        location: location,
        startDate: startDate,
        endDate: endDate,
        status: status,
        responsibilities: responsibilities,
      );
}
