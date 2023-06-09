import 'dart:convert';

import 'package:manda_aquela/data/repositories/jsonFixture/fixture_reader.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/repositories/musician_repository/musician_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class MusicianRepositoryImpl extends MusicianRepository {
  MusicianRepositoryImpl({required this.client});
  final HttpService client;

  @override
  Future<List<Musician>> fetchMusicianList() async {
    try {
      const jsonString = '''{
    "code": 0,
    "data": [
        {
            "name" : "Thiaguinho",
            "skills" : [
                "Pagode",
                "Samba", 
                "Violão",
                "Canto"
            ],
            "imageUrl": "https://cdn.ligadosgames.com/imagens/logo-de-flamengo-dls.jpg",
            "rate": 4,
            "value": 300.0
        },
        {
            "name" : "Belo",
            "skills" : [
                "Pagode",
                "Samba", 
                "Violão",
                "Canto"
            ],
            "imageUrl": "https://cdn.ligadosgames.com/imagens/logo-de-flamengo-dls.jpg",
            "rate": 5,
            "value": 400.0
        },
        {
            "name" : "Jimmy Hendrix",
            "skills" : [
                "Rock",
                "Guitarra", 
                "Violão",
                "Canto"
            ],
            "imageUrl": "https://cdn.ligadosgames.com/imagens/logo-de-flamengo-dls.jpg",
            "rate": 3,
            "value": 200.0
        },
        {
            "name" : "MF DOOM",
            "skills" : [
                "Rap",
                "Hip Hop", 
                "Canto"
            ],
            "imageUrl": "https://cdn.ligadosgames.com/imagens/logo-de-flamengo-dls.jpg",
            "rate": 5,
            "value": 600.0
        },
        {
            "name" : "Jorge ben Jor",
            "skills" : [
                "Samba", 
                "Violão",
                "Canto",
                "MPB"
            ],
            "imageUrl": "https://cdn.ligadosgames.com/imagens/logo-de-flamengo-dls.jpg",
            "rate": 5,
            "value": 200.0
        },
        {
            "name" : "Xamã",
            "skills" : [
                "Pagode",
                "Samba", 
                "Violão",
                "Canto"
            ],
            "imageUrl": "https://cdn.ligadosgames.com/imagens/logo-de-flamengo-dls.jpg",
            "rate": 1,
            "value": 150.0
        }
    ]
}''';

      final response = jsonDecode(jsonString)["data"];
      final musicianList = <Musician>[];

      for (dynamic item in response) {
        musicianList.add(Musician.fromMap(item));
      }

      return musicianList;
    } catch (e) {
      rethrow;
    }
  }
}
