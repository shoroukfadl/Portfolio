import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';

class ProfileModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? headline;
  final String? email;
  final String? phone;
  final String? location;
  final String? cv;
  final String? bio;
  final String? github;
  final String? linkedin;
  final String? image;
  final double? experince;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.headline,
    this.email,
    this.phone,
    this.location,
    this.bio,
    this.github,
    this.linkedin,
    this.image,
    this.cv,
    this.experince,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      headline: json['headline'],
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
      bio: json['bio'],
      github: json['github'],
      linkedin: json['linkedin'],
      image: json['profile_image_url'],
      cv: json['cv'],
      experince: json['experince']);

  static ProfileModel toModel(ProfileEntity?  profile) => ProfileModel(
      id:profile?. id,
      firstName:profile?. firstName,
      lastName:profile?. lastName,
      headline:profile?.headline,
      email:profile?. email,
      phone:profile?. phone,
      location:profile?. location,
      bio:profile?.bio,
      github:profile?. github,
      linkedin:profile?. linkedin,
      image:profile?. image,
      cv:profile?. cv,
      experince:profile?. experince);

  ProfileEntity toEntity() => ProfileEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      jobTitle: headline,
      email: email,
      phone: phone,
      location: location,
      summary: bio,
      github: github,
      linkedin: linkedin,
      image: image,

      headline: headline,
      experince: experince,
      cv: cv);

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'job_title': headline,
        'email': email,
        'phone': phone,
        'location': location,
        'summary': bio,
        'github': github,
        'linkedin': linkedin,
        'image': image,
      };
}
