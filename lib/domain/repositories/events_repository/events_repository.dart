import 'package:manda_aquela/domain/entities/event.dart';

abstract class EventsRepository {
  Future<List<Events>> fetchEventsList();
}
