// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/core/endpoints.dart';
import 'package:manda_aquela/data/models/music_style_model.dart';
import 'package:manda_aquela/data/models/opportunity_request.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/repositories/opportunity_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class OpportunityRepositoryImpl extends OpportunityRepository {
  OpportunityRepositoryImpl({
    required this.service,
  });

  final HttpService service;

  @override
  Future<List<MusicStyle>> fetchMusicStyles() async {
    try {
      final response = await service.get('${Endpoints.base}/music-styles', {});
      final data = jsonDecode(response.body)["data"]["musicStyles"];
      final styles = <MusicStyle>[];
      for (dynamic item in data) {
        styles.add(MusicStyleModel.fromMap(item).toEntity());
      }
      return styles;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Oportunity>> fetchOpportunities() {
    // TODO: implement fetchOpportunities
    throw UnimplementedError();
  }

  @override
  Future<void> registerOpportunity(
      {required OpportunityRequest request}) async {
    try {
      print(request.toJson());
      await service.post(
          '${Endpoints.base}/oportunities/oportunity', request.toJson(), {});
    } catch (e) {
      rethrow;
    }
  }
}
