// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Establishment {
  Establishment(
      {required this.name,
      required this.type,
      required this.address,
      required this.capacity});

  final String name;
  final String type;
  final String address;
  final int capacity;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'address': address,
      'capacity': capacity,
    };
  }

  factory Establishment.fromMap(Map<String, dynamic> map) {
    return Establishment(
      name: map['name'] as String,
      type: map['type'] as String,
      address: map['address'] as String,
      capacity: map['capacity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Establishment.fromJson(String source) =>
      Establishment.fromMap(json.decode(source) as Map<String, dynamic>);
}
