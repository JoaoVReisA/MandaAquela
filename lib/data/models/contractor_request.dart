// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/address_model.dart';
import 'package:manda_aquela/data/models/establishment_model.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';

class ContractorRequest {
  ContractorRequest(
      {required this.uuid,
      required this.description,
      required this.socialMedia,
      required this.establishment,
      required this.address,
      this.imageBase64});

  final String uuid;
  final String description;
  final List<SocialMedia>? socialMedia;
  final EstablishmentModel? establishment;
  final AddressModel address;
  final String? imageBase64;
  final String userType = 'contractor';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'description': description,
      'socialMedia': socialMedia?.map((x) => x.toMap()).toList(),
      'establishment': establishment?.toMap(),
      'address': address.toMap(),
      'image': imageBase64,
      'userType': userType,
    };
  }

  factory ContractorRequest.fromMap(Map<String, dynamic> map) {
    return ContractorRequest(
      uuid: map['uuid'] as String,
      description: map['description'] as String,
      socialMedia: List<SocialMedia>.from(
        (map['socialMedia'] as List<dynamic>).map<SocialMedia>(
          (x) => SocialMedia.fromMap(x as Map<String, dynamic>),
        ),
      ),
      establishment: EstablishmentModel.fromMap(
          map['establishment'] as Map<String, dynamic>),
      address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
      imageBase64: map['imageBase64'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractorRequest.fromJson(String source) =>
      ContractorRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
