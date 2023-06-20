// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/domain/entities/event_category.dart';

class EventCategoryModel {
  final String name;
  final String id;
  EventCategoryModel({
    required this.name,
    required this.id,
  });

  EventCategoryModel copyWith({
    String? name,
    String? id,
  }) {
    return EventCategoryModel(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory EventCategoryModel.fromMap(Map<String, dynamic> map) {
    return EventCategoryModel(
      name: map['name'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventCategoryModel.fromJson(String source) =>
      EventCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'EventCategoryModel(name: $name, id: $id)';

  @override
  bool operator ==(covariant EventCategoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;

  EventCategory toEntity() {
    return EventCategory(
      name: name,
      id: id,
    );
  }
}
