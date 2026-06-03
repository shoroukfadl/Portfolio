import 'package:equatable/equatable.dart';

class TechnicalSkillEntity extends Equatable {
  final String? category;
  final List<SkillEntity> skills;

  const TechnicalSkillEntity({
    this.category,
    this.skills = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        category,
        skills,
      ];
}

class SkillEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? category;
  final String? skillName;

  const SkillEntity({
    this.id,
    this.profileId,
    this.category,
    this.skillName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        profileId,
        category,
        skillName,
      ];
}
