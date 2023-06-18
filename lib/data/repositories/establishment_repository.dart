// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:manda_aquela/core/endpoints.dart';
import 'package:manda_aquela/data/models/establishment_type_model.dart';
import 'package:manda_aquela/domain/entities/establishment_type.dart';
import 'package:manda_aquela/domain/repositories/establishment_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class EstablishmentRepositoryImpl extends EstablishmentRepository {
  EstablishmentRepositoryImpl({
    required this.client,
  });

  final HttpService client;

  @override
  Future<List<EstablishmentType>> fetchEstablishmentTypes() async {
    try {
      final response =
          await client.get('${Endpoints.base}/establishment-type/types', {});

      final data = jsonDecode(response.body)["data"];
      final types = <EstablishmentType>[];

      for (final item in data) {
        types.add(EstablishmentTypeModel.fromMap(item).toEntity());
      }

      return types;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
