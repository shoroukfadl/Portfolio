import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';

class ExperienceModel {
  final String? id;
  final String? profileId;
  final String? jobTitle;
  final String? companyName;
  final String? location;
  final String? period;
  final bool status;
  final List<String> responsibilities;

  ExperienceModel({
    this.id,
    this.profileId,
    this.jobTitle,
    this.companyName,
    this.location,
    this.period,
    this.responsibilities=const [],
    this.status=false
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
    id: json['id']?.toString(),
    profileId: json['profile_id'],
    jobTitle: json['job_title'],
    companyName: json['company_name'],
    location: json['location'],
    period: json['period'],
    status: json['status']??false,
    responsibilities: List<String>.from(json['responsibilities'] ?? []),
  );

  Map<String, dynamic> toJson() => {
    'job_title': jobTitle,
    'company_name': companyName,
    'location': location,
    'period': period,
    'responsibilities': responsibilities,
  };

   ExperienceModel toModel() => ExperienceModel(
    id:id ,
    profileId:profileId,
    jobTitle:jobTitle,
    companyName:companyName ,
    location:location ,
    period:period ,
    responsibilities:responsibilities ,
     status: status
  );
   ExperienceEntity fromModel() => ExperienceEntity(
    id:id ,
    profileId:profileId,
    jobTitle:jobTitle,
    companyName:companyName ,
    location:location ,
    period:period ,
    status: status,
    responsibilities:responsibilities ,
  );

}
