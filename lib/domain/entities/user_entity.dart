import 'package:manda_aquela/domain/entities/address.dart';
import 'package:manda_aquela/domain/entities/establishment.dart';
import 'package:manda_aquela/domain/entities/skill.dart';

class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.isMusician,
    required this.isContractor,
    required this.isSignUpCompleted,
    required this.description,
    required this.socialMedias,
    this.address,
    this.establishment,
    this.image,
    this.musicianValue,
    this.skills,
  });

  final String id;
  final String name;
  final String email;
  final bool isMusician;
  final bool isContractor;
  final bool isSignUpCompleted;
  final String description;
  final List<String?> socialMedias;
  final String? image;
  final Address? address;
  final List<Skill?>? skills;
  final double? musicianValue;
  final Establishment? establishment;
}
