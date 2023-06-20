import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class FetchEventsCategoriesUseCase {
  Future<List<EventCategory>> call();
}

class RemoteFetchEventsCategoriesUseCase
    implements FetchEventsCategoriesUseCase {
  RemoteFetchEventsCategoriesUseCase({required this.repository});

  final EventsRepository repository;

  @override
  Future<List<EventCategory>> call() async {
    return repository.fetchEventsCategories();
  }
}
