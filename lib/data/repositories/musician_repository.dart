import 'dart:convert';

import 'package:manda_aquela/core/endpoints.dart';
import 'package:manda_aquela/data/models/musician_model.dart';
import 'package:manda_aquela/data/models/skill_model.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/repositories/musician_repository/musician_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class MusicianRepositoryImpl extends MusicianRepository {
  MusicianRepositoryImpl({required this.client});
  final HttpService client;

  @override
  Future<List<Musician>> fetchMusicianList({required String musicianId}) async {
    try {
      final response =
          await client.get('${Endpoints.base}/musicians/$musicianId', {});
      print(response.body);
      final data = jsonDecode(response.body)["data"]["musicians"];
      final musicianList = <Musician>[];

      for (dynamic item in data) {
        musicianList.add(MusicianModel.fromMap(item).toEntity());
      }

      return musicianList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Skill>> fetchSkillList() async {
    try {
      final response = await client.get('${Endpoints.base}/skill/skills', {});
      final data = jsonDecode(response.body)["data"]["skill"];
      final skillList = <Skill>[];

      for (dynamic item in data) {
        skillList.add(SkillModel.fromMap(item).toEntity());
      }

      return skillList;
    } catch (e) {
      rethrow;
    }
  }
}
