import 'package:equatable/equatable.dart';

class TechnicalSkillEntity extends Equatable {
  final String? category;
  final List<SkillEntity> skills;
  final String? id;
  final int? order;
  final String? icon;

  const TechnicalSkillEntity({
    this.category,
    this.skills = const [],
    this.id,
    this.order,
    this.icon,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [category, skills, order, icon, id];
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
