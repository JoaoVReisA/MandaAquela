import 'dart:convert';

import 'package:manda_aquela/core/endpoints.dart';
import 'package:manda_aquela/data/models/event_category_model.dart';
import 'package:manda_aquela/data/models/event_request.dart';
import 'package:manda_aquela/data/models/events_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class EventsRepositoryImpl extends EventsRepository {
  EventsRepositoryImpl({required this.client});

  final HttpService client;

  @override
  Future<List<Events>> fetchEventsList() async {
    try {
      final response = await client.get('${Endpoints.base}/events', {});
      print(response.body);
      final data = jsonDecode(response.body)["data"]["events"];
      final eventsList = <Events>[];
      for (dynamic item in data) {
        eventsList.add(EventsModel.fromMap(item).toEntity());
      }
      return eventsList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registerEvent({required EventRequest event}) async {
    try {
      print(event.toJson());
      await client.post('${Endpoints.base}/events/event', event.toJson(), {});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventCategory>> fetchEventsCategories() async {
    try {
      final response = await client.get('${Endpoints.base}/categories', {});
      final data = jsonDecode(response.body)["data"]["categories"];
      final categories = <EventCategory>[];
      for (dynamic item in data) {
        categories.add(EventCategoryModel.fromMap(item).toEntity());
      }
      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
