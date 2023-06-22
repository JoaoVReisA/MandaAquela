// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/music_style_model.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';

class OpportunityModel {
  OpportunityModel({
    this.musicianId,
    this.musicianInterestedIds = const [],
    required this.id,
    required this.description,
    required this.name,
    required this.value,
    required this.musicStyle,
    required this.city,
    required this.strDate,
    this.date,
  });

  final String id;
  final DateTime? date;
  final String description;
  final String name;
  final String city;
  final String value;
  final List<MusicStyleModel> musicStyle;
  final String strDate;
  final List<String> musicianInterestedIds;
  final String? musicianId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': '${date?.year}-${date?.month}-${date?.day}',
      'description': description,
      'name': name,
      'value': value,
      'city': city,
      'musicStyle': musicStyle.map((x) => x.toMap()).toList(),
    };
  }

  factory OpportunityModel.fromMap(Map<String, dynamic> map) {
    return OpportunityModel(
      city: map['city'] as String? ?? '',
      id: map['id'] as String,
      musicianId: map['musicianId'] as String?,
      strDate: map['date'] as String,
      description: map['description'] as String,
      name: map['name'] as String,
      value: map['value'] as String,
      musicianInterestedIds: map['musicianInterestedIds'] != null
          ? List<String>.from(map['musicianInterestedIds'] as List<dynamic>)
          : [],
      musicStyle: map['musicStyle'] != null
          ? List<MusicStyleModel>.from(
              (map['musicStyle'] as List<dynamic>).map<MusicStyleModel>(
                (x) => MusicStyleModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OpportunityModel.fromJson(String source) =>
      OpportunityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Oportunity toEntity() {
    return Oportunity(
      id: id,
      date: date ?? DateTime.now(),
      description: description,
      name: name,
      value: value,
      musicStyle: musicStyle.map((e) => e.toEntity()).toList(),
      city: city,
      musicianInterestedIds: musicianInterestedIds,
      musicianId: musicianId,
    );
  }
}
