import 'package:manda_aquela/domain/entities/establishment_type.dart';

abstract class EstablishmentRepository {
  Future<List<EstablishmentType>> fetchEstablishmentTypes();
}
