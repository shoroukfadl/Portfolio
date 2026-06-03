
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';

class ProfileModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? jobTitle;
  final String? email;
  final String? phone;
  final String? location;
  final String? summary;
  final String? github;
  final String? linkedin;
  final String? image;
  final String? cv;
  final bool militaryService;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.jobTitle,
    this.email,
    this.phone,
    this.location,
    this.summary,
    this.github,
    this.linkedin,
    this.militaryService =false, this.image, this.cv,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    jobTitle: json['job_title'],
    email: json['email'],
    phone: json['phone'],
    location: json['location'],
    summary: json['summary'],
    github: json['github'],
    linkedin: json['linkedin'],
    image: json['image'],
    militaryService: json['military_service'] ?? false,
    cv: json['cv']
  );

 ProfileModel toModel() => ProfileModel(
    id:id,
    firstName:firstName,
    lastName:lastName,
    jobTitle:jobTitle,
    email:email,
    phone:phone,
    location:location,
    summary:summary,
    github:github,
    linkedin:linkedin,
    militaryService:militaryService,
   image: image,
   cv:cv
  );
 ProfileEntity toEntity() => ProfileEntity(
    id:id,
    firstName:firstName,
    lastName:lastName,
    jobTitle:jobTitle,
    email:email,
    phone:phone,
    cv: cv,
    location:location,
    summary:summary,
    github:github,
    linkedin:linkedin,
    image: image,
    militaryService:militaryService,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'job_title': jobTitle,
    'email': email,
    'phone': phone,
    'location': location,
    'summary': summary,
    'github': github,
    'linkedin': linkedin,
    'image':image,
    'military_service': militaryService,
  };
}
