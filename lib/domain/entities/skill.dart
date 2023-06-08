import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  Skill({required this.skillName, required this.isSelected});
  final String skillName;
  bool isSelected;

  @override
  List<Object?> get props => [skillName];
}
