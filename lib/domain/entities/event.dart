// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/domain/entities/establishment.dart';

class Events {
  Events({
    required this.name,
    this.establishment,
    required this.address,
    required this.date,
  });

  final String name;
  final Establishment? establishment;
  final String address;
  final DateTime date;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'establishment': establishment?.toMap(),
      'address': address,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Events.fromMap(Map<String, dynamic> map) {
    return Events(
      name: map['name'] as String,
      establishment: map['establishment'] != null
          ? Establishment.fromMap(map['establishment'] as Map<String, dynamic>)
          : null,
      address: map['address'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Events.fromJson(String source) =>
      Events.fromMap(json.decode(source) as Map<String, dynamic>);
}
