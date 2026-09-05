import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? id;
  final String? image;
  final String? firstName;
  final String? lastName;
  final String? jobTitle;
  final String? email;
  final String? phone;
  final String? location;
  final String? summary;
  final String? github;
  final String? linkedin;
  final String? cv;
  final String? headline;
  final String? bio;

  final double? experince;

  const ProfileEntity(
      {this.id,
      this.firstName,
      this.lastName,
      this.jobTitle,
      this.email,
      this.phone,
      this.location,
      this.summary,
      this.github,
      this.linkedin,
      this.image,
      this.cv,
      this.experince,
      this.headline,
      this.bio});

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        jobTitle,
        email,
        phone,
        location,
        summary,
        github,
        linkedin,
        cv,
        image,
        experince,
        bio,
        headline
      ];
}
