import 'package:equatable/equatable.dart';

class TechnicalSkillEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? category;
  final List<String?> skillName;

  const TechnicalSkillEntity({
    this.id,
    this.profileId,
    this.category,
    this.skillName =const [],
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
