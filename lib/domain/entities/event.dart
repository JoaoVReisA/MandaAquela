// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:manda_aquela/domain/entities/establishment.dart';

class Events {
  Events({
    required this.name,
    this.establishment,
    required this.address,
    required this.date,
  });

  final String name;
  final Establishment? establishment;
  final String address;
  final DateTime date;
}
