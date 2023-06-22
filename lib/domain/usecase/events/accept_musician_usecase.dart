import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class AcceptMusician {
  Future<void> call(
      {required Musician musician, required Oportunity oportunity});
}

class RemoteAcceptMusician implements AcceptMusician {
  RemoteAcceptMusician({required this.repository});
  final EventsRepository repository;

  @override
  Future<void> call(
      {required Musician musician, required Oportunity oportunity}) async {
    await repository.acceptMusician(musician, oportunity);
  }
}
