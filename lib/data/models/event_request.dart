// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/opportunity_model.dart';

class EventRequest {
  final String name;
  final String locale;
  final String date;
  final String description;
  final int capacity;
  final String categoryId;
  final String contractId;
  final OpportunityModel opportunity;
  EventRequest({
    required this.name,
    required this.locale,
    required this.date,
    required this.description,
    required this.capacity,
    required this.categoryId,
    required this.contractId,
    required this.opportunity,
  });

  EventRequest copyWith({
    String? name,
    String? locale,
    String? date,
    String? description,
    int? capacity,
    String? categoryId,
    String? contractId,
    OpportunityModel? opportunity,
  }) {
    return EventRequest(
      name: name ?? this.name,
      locale: locale ?? this.locale,
      date: date ?? this.date,
      description: description ?? this.description,
      capacity: capacity ?? this.capacity,
      categoryId: categoryId ?? this.categoryId,
      contractId: contractId ?? this.contractId,
      opportunity: opportunity ?? this.opportunity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'locale': locale,
      'date': date,
      'description': description,
      'capacity': capacity,
      'categoryId': categoryId,
      'contractId': contractId,
      'opportunity': opportunity.toMap(),
    };
  }

  factory EventRequest.fromMap(Map<String, dynamic> map) {
    return EventRequest(
      name: map['name'] as String,
      locale: map['locale'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      capacity: map['capacity'] as int,
      categoryId: map['categoryId'] as String,
      contractId: map['contractId'] as String,
      opportunity:
          OpportunityModel.fromMap(map['opportunity'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventRequest.fromJson(String source) =>
      EventRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventRequest(name: $name, locale: $locale, date: $date, description: $description, capacity: $capacity, categoryId: $categoryId, contractId: $contractId, opportunity: $opportunity)';
  }

  @override
  bool operator ==(covariant EventRequest other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.locale == locale &&
        other.date == date &&
        other.description == description &&
        other.capacity == capacity &&
        other.categoryId == categoryId &&
        other.contractId == contractId &&
        other.opportunity == opportunity;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        locale.hashCode ^
        date.hashCode ^
        description.hashCode ^
        capacity.hashCode ^
        categoryId.hashCode ^
        contractId.hashCode ^
        opportunity.hashCode;
  }
}
