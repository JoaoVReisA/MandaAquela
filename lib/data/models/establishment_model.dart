// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/establishment_type_model.dart';

class EstablishmentModel {
  EstablishmentModel(
      {required this.name,
      required this.type,
      required this.address,
      required this.capacity});

  final String name;
  final List<EstablishmentTypeModel>? type;
  final String address;
  final int capacity;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'types': type?.map((x) => x.toMap()).toList(),
      'address': address,
      'capacity': capacity,
    };
  }

  factory EstablishmentModel.fromMap(Map<String, dynamic> map) {
    return EstablishmentModel(
      name: map['name'] as String,
      type: map['types'] != null
          ? List<EstablishmentTypeModel>.from(
              (map['types'] as List<dynamic>).map<EstablishmentTypeModel>(
                (x) =>
                    EstablishmentTypeModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      address: map['address'] as String,
      capacity: map['capacity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory EstablishmentModel.fromJson(String source) =>
      EstablishmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
