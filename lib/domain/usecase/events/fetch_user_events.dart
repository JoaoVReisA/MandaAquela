import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class FetchUserEventsUseCase {
  Future<List<Events>> call(String uid);
}

class RemoteFetchUserEvents implements FetchUserEventsUseCase {
  RemoteFetchUserEvents({required this.repository});
  final EventsRepository repository;

  @override
  Future<List<Events>> call(String uid) {
    return repository.fetchUserEvents(uid);
  }
}
