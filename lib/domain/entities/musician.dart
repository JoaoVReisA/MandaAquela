// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Musician {
  Musician(
      {required this.name,
      required this.skills,
      required this.imageUrl,
      required this.rate,
      required this.value});

  final String name;
  final List<String> skills;
  final String imageUrl;
  final int rate;
  final double value;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'skills': skills,
      'imageUrl': imageUrl,
      'rate': rate,
      'value': value,
    };
  }

  factory Musician.fromMap(Map<String, dynamic> map) {
    return Musician(
      name: map['name'] as String,
      skills: List<String>.from((map['skills'])),
      imageUrl: map['imageUrl'] as String,
      rate: map['rate'] as int,
      value: map['value'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Musician.fromJson(String source) =>
      Musician.fromMap(json.decode(source) as Map<String, dynamic>);
}
