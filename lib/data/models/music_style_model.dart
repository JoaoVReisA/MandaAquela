// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/domain/entities/music_style.dart';

class MusicStyleModel {
  MusicStyleModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory MusicStyleModel.fromMap(Map<String, dynamic> map) {
    return MusicStyleModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MusicStyleModel.fromJson(String source) =>
      MusicStyleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MusicStyle toEntity() => MusicStyle(
        id: id,
        name: name,
      );
}
