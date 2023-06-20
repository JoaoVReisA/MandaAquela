// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/address_model.dart';
import 'package:manda_aquela/data/models/skill_model.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';

class MusicianRequest {
  MusicianRequest({
    required this.uuid,
    required this.description,
    required this.skills,
    required this.fee,
    required this.address,
    this.imageBase64,
    this.socialMedia,
  });

  final String uuid;
  final String description;
  final List<SocialMedia>? socialMedia;
  final List<SkillModel> skills;
  final String fee;
  final AddressModel address;
  final String? imageBase64;
  final String userType = 'musician';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'description': description,
      'socialMedia': socialMedia?.map((x) => x.toMap()).toList(),
      'skills': skills.map((x) => x.toMap()).toList(),
      'fee': fee,
      'address': address.toMap(),
      'image': imageBase64,
      'userType': userType,
    };
  }

  factory MusicianRequest.fromMap(Map<String, dynamic> map) {
    return MusicianRequest(
      uuid: map['uuid'] as String,
      description: map['description'] as String,
      socialMedia: map['socialMedia'] != null
          ? List<SocialMedia>.from(
              (map['socialMedia'] as List<dynamic>).map<SocialMedia?>(
                (x) => SocialMedia.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      skills: List<SkillModel>.from(
        (map['skills'] as List<int>).map<SkillModel>(
          (x) => SkillModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      fee: map['fee'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      imageBase64: map['imageBase64'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicianRequest.fromJson(String source) =>
      MusicianRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
