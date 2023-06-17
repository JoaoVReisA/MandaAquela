import 'package:equatable/equatable.dart';
import 'package:manda_aquela/data/models/skill_model.dart';

class Skill extends Equatable {
  Skill({
    required this.skillName,
    required this.isSelected,
    required this.id,
  });
  final String id;
  final String skillName;
  bool isSelected;

  @override
  List<Object?> get props => [skillName];

  SkillModel toModel() {
    return SkillModel(
      id: id,
      name: skillName,
    );
  }
}
