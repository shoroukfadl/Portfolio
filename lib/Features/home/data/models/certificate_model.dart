import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';

class CertificateModel {
  final String? id;
  final String? profileId;
  final String? courseName;
  final String? provider;
  final String? issueDate;
  final String? certificateImageUrl;
  final String? credentialUrl;

  CertificateModel({
    this.id,
    this.profileId,
    this.courseName,
    this.provider,
    this.issueDate,
    this.credentialUrl,
    this.certificateImageUrl,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id']?.toString(),
      profileId: json['profile_id'] as String,
      courseName: json['course_name'] as String,
      provider: json['provider'] as String,
      issueDate: json['issue_date'] as String,
      credentialUrl: json['credential_url'] as String,
      certificateImageUrl: json['certificate_image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_name': courseName,
      'provider': provider,
      'issue_date': issueDate,
      'credential_url': credentialUrl,
      'certificate_image_url': certificateImageUrl
    };
  }

  CertificateEntity fromModel() => CertificateEntity(
      id: id,
      profileId: profileId,
      courseName: courseName,
      provider: provider,
      issueDate: issueDate,
      credentialUrl: credentialUrl,
      certificateImageUrl: certificateImageUrl);
  CertificateModel toModel() => CertificateModel(
        id: id,
        profileId: profileId,
        certificateImageUrl: certificateImageUrl,
        courseName: courseName,
        provider: provider,
        issueDate: issueDate,
        credentialUrl: credentialUrl,
      );
}
