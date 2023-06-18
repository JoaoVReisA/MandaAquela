// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manda_aquela/data/models/opportunity_model.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';

class Oportunity {
  Oportunity({
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
  final List<MusicStyle> musicStyle;

  OpportunityModel toModel() => OpportunityModel(
        id: id,
        date: date,
        description: description,
        name: name,
        value: value,
        musicStyle: musicStyle.map((e) => e.toModel()).toList(),
      );
}
