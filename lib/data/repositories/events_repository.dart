import 'dart:convert';

import 'package:manda_aquela/domain/entities/event.dart';
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
            "name": "Evento bem legal",
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
}
