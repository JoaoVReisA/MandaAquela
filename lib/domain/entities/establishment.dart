import 'package:manda_aquela/data/models/establishment_model.dart';
import 'package:manda_aquela/domain/entities/establishment_type.dart';

class Establishment {
  Establishment(
      {required this.name,
      required this.type,
      required this.address,
      required this.capacity});

  final String name;
  final List<EstablishmentType> type;
  final String address;
  final int capacity;

  EstablishmentModel toModel() {
    return EstablishmentModel(
      name: name,
      type: type.map((e) => e.toModel()).toList(),
      address: address,
      capacity: capacity,
    );
  }
}
