import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class FetchMusicianEventsUseCase {
  Future<List<Events>> call(String uid);
}

class RemoteFetchMusicianEvents implements FetchMusicianEventsUseCase {
  RemoteFetchMusicianEvents({required this.repository});
  final EventsRepository repository;

  @override
  Future<List<Events>> call(String uid) {
    return repository.fetchMusicianEvents(uid);
  }
}
