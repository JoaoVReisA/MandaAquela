// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/address_model.dart';
import 'package:manda_aquela/data/models/skill_model.dart';
import 'package:manda_aquela/domain/entities/establishment.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';

class UserModel {
  UserModel({
    this.id,
    this.description,
    this.name,
    this.email,
    this.type,
    this.isSignedUp,
    this.photoUrl,
    this.rate,
    this.socialMedia,
    this.token,
    this.establishments,
    this.skills,
    this.address,
    this.fee,
  });

  final String? id;
  final String? description;
  final String? name;
  final String? email;
  final String? type;
  final bool? isSignedUp;
  final String? photoUrl;
  final int? rate;
  final List<SocialMedia>? socialMedia;
  final String? token;

  //Contractor only
  final List<Establishment>? establishments;

  //Musician only
  final List<SkillModel>? skills;
  final AddressModel? address;
  final String? fee;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'name': name,
      'email': email,
      'type': type,
      'isSignedUp': isSignedUp,
      'photoUrl': photoUrl,
      'rate': rate,
      'socialMedia': socialMedia?.map((x) => x.toMap()).toList(),
      'token': token,
      'establishments': establishments?.map((x) => x.toMap()).toList(),
      'skills': skills?.map((x) => x.toMap()).toList(),
      'address': address?.toMap(),
      'fee': fee,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      isSignedUp: map['isSignedUp'] != null ? map['isSignedUp'] as bool : null,
      photoUrl: map['photoUrl'] != null ? map['photoUrl'] as String : null,
      rate: map['rate'] != null ? map['rate'] as int : null,
      socialMedia: map['socialMedia'] != null
          ? List<SocialMedia>.from(
              (map['socialMedia'] as List<dynamic>).map<SocialMedia?>(
                (x) => SocialMedia.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      token: map['token'] != null ? map['token'] as String : null,
      establishments: map['establishments'] != null
          ? List<Establishment>.from(
              (map['establishments'] as List<dynamic>).map<Establishment?>(
                (x) => Establishment.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      skills: map['skills'] != null
          ? List<SkillModel>.from(
              (map['skills'] as List<dynamic>).map<SkillModel?>(
                (x) => SkillModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      address: map['address'] != null
          ? AddressModel.fromMap(map['address'] as Map<String, dynamic>)
          : null,
      fee: map['fee'] != null ? map['fee'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
