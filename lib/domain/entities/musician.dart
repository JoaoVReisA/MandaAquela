// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manda_aquela/domain/entities/address.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';

class Musician {
  Musician({
    required this.id,
    required this.name,
    required this.rate,
    required this.isSignedUp,
    required this.description,
    required this.socialMedia,
    required this.address,
    required this.fee,
    required this.skills,
    required this.photoUrl,
  });
  final String id;
  final String name;
  final int rate;
  final bool isSignedUp;
  final String description;
  final List<SocialMedia> socialMedia;
  final Address address;
  final String fee;
  final List<Skill> skills;
  final String? photoUrl;
}
