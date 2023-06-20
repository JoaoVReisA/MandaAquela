import 'package:manda_aquela/data/models/event_request.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/event_category.dart';

abstract class EventsRepository {
  Future<List<Events>> fetchEventsList();

  Future<void> registerEvent({required EventRequest event});

  Future<List<EventCategory>> fetchEventsCategories();
}
