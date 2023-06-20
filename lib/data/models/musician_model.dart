// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/address_model.dart';
import 'package:manda_aquela/data/models/skill_model.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';

class MusicianModel {
  MusicianModel({
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
  final AddressModel address;
  final String fee;
  final List<SkillModel> skills;
  final String? photoUrl;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rate': rate,
      'isSignedUp': isSignedUp,
      'description': description,
      'socialMedia': socialMedia.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
      'fee': fee,
      'skills': skills.map((x) => x.toMap()).toList(),
      'photoUrl': photoUrl,
    };
  }

  factory MusicianModel.fromMap(Map<String, dynamic> map) {
    return MusicianModel(
      id: map['id'] as String,
      name: map['name'] != null ? map['name'] as String : 'Usuário',
      rate: map['rate'] as int,
      isSignedUp: map['isSignedUp'] as bool,
      description: map['description'] as String,
      socialMedia: List<SocialMedia>.from(
        (map['socialMedia'] as List<dynamic>).map<SocialMedia>(
          (x) => SocialMedia.fromMap(x as Map<String, dynamic>),
        ),
      ),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      fee: map['fee'] as String,
      skills: List<SkillModel>.from(
        (map['skills'] as List<dynamic>).map<SkillModel>(
          (x) => SkillModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      photoUrl: map['photoURL'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicianModel.fromJson(String source) =>
      MusicianModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Musician toEntity() {
    return Musician(
      id: id,
      name: name,
      rate: rate,
      isSignedUp: isSignedUp,
      description: description,
      socialMedia: socialMedia,
      address: address.toEntity(),
      fee: fee,
      skills: skills.map((e) => e.toEntity()).toList(),
      photoUrl: photoUrl,
    );
  }
}
