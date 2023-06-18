// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/music_style_model.dart';

class OpportunityModel {
  OpportunityModel({
    required this.id,
    required this.date,
    required this.description,
    required this.name,
    required this.value,
    required this.musicStyle,
  });

  final String id;
  final DateTime date;
  final String description;
  final String name;
  final String value;
  final List<MusicStyleModel> musicStyle;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'description': description,
      'name': name,
      'value': value,
      'musicStyle': musicStyle.map((x) => x.toMap()).toList(),
    };
  }

  factory OpportunityModel.fromMap(Map<String, dynamic> map) {
    return OpportunityModel(
      id: map['id'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      description: map['description'] as String,
      name: map['name'] as String,
      value: map['value'] as String,
      musicStyle: List<MusicStyleModel>.from(
        (map['musicStyle'] as List<int>).map<MusicStyleModel>(
          (x) => MusicStyleModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpportunityModel.fromJson(String source) =>
      OpportunityModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
