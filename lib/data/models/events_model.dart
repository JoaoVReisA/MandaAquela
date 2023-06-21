// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/event_category_model.dart';
import 'package:manda_aquela/data/models/opportunity_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';

class EventsModel {
  EventsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.locale,
    required this.capacity,
    required this.contractorId,
    required this.oportunities,
    required this.category,
    required this.date,
  });

  final String id;
  final String name;
  final String description;
  final String locale;
  final int capacity;
  final String contractorId;
  final List<OpportunityModel> oportunities;
  final EventCategoryModel category;
  final String date;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'locale': locale,
      'capacity': capacity,
      'contractorId': contractorId,
      'oportunities': oportunities.map((x) => x.toMap()).toList(),
      'category': category.toMap(),
    };
  }

  factory EventsModel.fromMap(Map<String, dynamic> map) {
    return EventsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      locale: map['locale'] as String,
      capacity: map['capacity'] as int,
      contractorId: map['contractorId'] as String,
      oportunities: List<OpportunityModel>.from(
        (map['oportunities'] as List<dynamic>).map<OpportunityModel>(
          (x) => OpportunityModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      category:
          EventCategoryModel.fromMap(map['category'] as Map<String, dynamic>),
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventsModel.fromJson(String source) =>
      EventsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Events toEntity() {
    return Events(
        id: id,
        name: name,
        description: description,
        locale: locale,
        capacity: capacity,
        contractorId: contractorId,
        oportunities: oportunities.map((x) => x.toEntity()).toList(),
        category: category.toEntity(),
        date: date);
  }
}
