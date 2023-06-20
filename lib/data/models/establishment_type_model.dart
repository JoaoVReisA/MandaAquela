// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/domain/entities/establishment_type.dart';

class EstablishmentTypeModel {
  final String id;
  final String name;

  EstablishmentTypeModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory EstablishmentTypeModel.fromMap(Map<String, dynamic> map) {
    return EstablishmentTypeModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EstablishmentTypeModel.fromJson(String source) =>
      EstablishmentTypeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  EstablishmentType toEntity() {
    return EstablishmentType(
      id: id,
      name: name,
    );
  }
}
