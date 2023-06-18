import 'package:equatable/equatable.dart';
import 'package:manda_aquela/data/models/establishment_type_model.dart';

class EstablishmentType extends Equatable {
  final String id;
  final String name;

  const EstablishmentType({required this.id, required this.name});

  @override
  List<Object?> get props => [name, id];

  EstablishmentTypeModel toModel() {
    return EstablishmentTypeModel(
      id: id,
      name: name,
    );
  }
}
