import 'dart:convert';

import 'package:manda_aquela/core/endpoints.dart';
import 'package:manda_aquela/data/models/event_category_model.dart';
import 'package:manda_aquela/data/models/event_request.dart';
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
      const jsonString = '''{
    "code": 0,
    "data": [
        {
            "name": "Evento bem legal",
            "establishment": {
                "name": "Bar do bira",
                "type": "Bar",
                "address": "Rua das pedras",
                "capacity": 60
            },
            "address": "Rua das pedras",
            "date": 1640979000000
        },
        {
            "name": "Festa Junina",
            "establishment": {
                "name": "Bar do bira",
                "type": "Bar",
                "address": "Rua das pedras",
                "capacity": 60
            },
            "address": "Rua das pedras",
            "date": 1640979000000
        },
        {
            "name": "Show de rock",
            "establishment": {
                "name": "Bar do bira",
                "type": "Bar",
                "address": "Rua das pedras",
                "capacity": 60
            },
            "address": "Rua das pedras",
            "date": 1640979000000
        },
        {
            "name": "Show de funk",
            "establishment": {
                "name": "Bar do bira",
                "type": "Bar",
                "address": "Rua das pedras",
                "capacity": 60
            },
            "address": "Rua das pedras",
            "date": 1640979000000
        },
        {
            "name": "Aquelas coisa",
            "establishment": {
                "name": "Bar do bira",
                "type": "Bar",
                "address": "Rua das pedras",
                "capacity": 60
            },
            "address": "Rua das pedras",
            "date": 1640979000000
        }
    ]
}''';

      final response = jsonDecode(jsonString)["data"];
      final eventsList = <Events>[];
      for (dynamic item in response) {
        eventsList.add(Events.fromMap(item));
      }
      return eventsList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registerEvent({required EventRequest event}) async {
    try {
      await client.post('${Endpoints.base}/events/event', event.toMap(), {});
      print(event.toString());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<EventCategory>> fetchEventsCategories() async {
    try {
      final response =
          await client.get('${Endpoints.base}/events/categories', {});
      final data = jsonDecode(response.body)["data"];
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
