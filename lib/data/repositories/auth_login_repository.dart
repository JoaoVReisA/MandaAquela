import 'package:manda_aquela/data/models/model_response.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

import '../mapper/response_mapper.dart';

class RemoteAuthLoginRepository extends AuthLoginRepository {
  RemoteAuthLoginRepository(
      {required this.client, required this.mapperResponse});
  final HttpService client;
  final ResponseMapper<ModelResponse> mapperResponse;

  loginServer() {}
}
