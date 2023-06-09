import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class FetchEventsListUsecase {
  Future<List<Events>> call();
}

class RemoteFetchEventsListUsecase extends FetchEventsListUsecase {
  RemoteFetchEventsListUsecase({required this.repository});
  final EventsRepository repository;

  @override
  Future<List<Events>> call() {
    return repository.fetchEventsList();
  }
}
