import 'package:manda_aquela/domain/entities/establishment_type.dart';
import 'package:manda_aquela/domain/repositories/establishment_repository.dart';

abstract class GetEstablishmentTypesUseCase {
  Future<List<EstablishmentType>> call();
}

class RemoteGetEstablishmentTypesUseCase
    implements GetEstablishmentTypesUseCase {
  RemoteGetEstablishmentTypesUseCase({
    required this.repository,
  });

  final EstablishmentRepository repository;

  @override
  Future<List<EstablishmentType>> call() async {
    return await repository.fetchEstablishmentTypes();
  }
}
