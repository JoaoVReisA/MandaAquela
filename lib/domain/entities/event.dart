// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';

class Events {
  final String id;
  final String name;
  final String description;
  final String locale;
  final int capacity;
  final String? contractorId;
  final List<Oportunity> oportunities;
  final EventCategory? category;
  final String date;
  final bool isClosed;

  Events({
    this.isClosed = false,
    required this.id,
    required this.name,
    required this.description,
    required this.locale,
    required this.date,
    required this.capacity,
    this.contractorId,
    required this.oportunities,
    this.category,
  });
}
