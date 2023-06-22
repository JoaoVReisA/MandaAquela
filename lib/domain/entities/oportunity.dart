// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manda_aquela/data/models/opportunity_model.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';

class Oportunity {
  Oportunity({
    this.musicianId,
    required this.id,
    required this.date,
    required this.description,
    required this.name,
    required this.city,
    required this.value,
    required this.musicStyle,
    this.musicianInterestedIds = const [],
  });

  final String id;
  final DateTime date;
  final String description;
  final String name;
  final String city;
  final String value;
  final List<MusicStyle> musicStyle;
  final List<String> musicianInterestedIds;
  final String? musicianId;

  OpportunityModel toModel() => OpportunityModel(
        city: city,
        id: id,
        date: date,
        strDate: date.toString(),
        description: description,
        name: name,
        value: value,
        musicStyle: musicStyle.map((e) => e.toModel()).toList(),
        musicianId: musicianId,
      );
}
