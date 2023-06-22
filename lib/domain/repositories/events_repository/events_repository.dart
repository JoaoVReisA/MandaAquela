import 'package:manda_aquela/data/models/event_request.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/entities/rate_request.dart';

abstract class EventsRepository {
  Future<List<Events>> fetchEventsList();

  Future<void> registerEvent({required EventRequest event});

  Future<List<EventCategory>> fetchEventsCategories();

  Future<List<Events>> fetchUserEvents(String uid);

  Future<List<Musician>> getOportunityMusicians(
      List<String> musicianInterestedIds);

  Future<void> acceptMusician(Musician musician, Oportunity oportunity);
  Future<void> rateEvent(RateRequest request);
}
