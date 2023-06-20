// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/domain/entities/address.dart';

class AddressModel {
  AddressModel({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.neighborhood,
    required this.number,
  });

  final String street;
  final String city;
  final String state;
  final String zipCode;
  final String neighborhood;
  final int number;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'neighborhood': neighborhood,
      'number': number,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipCode: map['zipCode'] as String,
      neighborhood: map['neighborhood'] as String,
      number: map['number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Address toEntity() {
    return Address(
      street: street,
      city: city,
      state: state,
      zipCode: zipCode,
      neighborhood: neighborhood,
      number: number,
    );
  }
}
